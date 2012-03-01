#!/usr/bin/env python

# Copyright (c) 2012 Michael-Keith Bernard
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# import os
import re
import sys
import shlex
import pprint
# import argparse
import subprocess

OWNER = "SegFaultAX"
REPOSITORY = "vim-dotfiles"

class IllegalGitOperation(Exception):
  pass

class Remote(object):
  def __init__(self, name, url, canonical=False):
    self.name = name
    self.url = url
    self.canonical = canonical
    self.master_commit = None

  def ls_ref(self, ref="refs/heads/master"):
    cmd_ls = call_command("git ls-remote --heads %s %s" % (self.name, ref))
    if not cmd_ls["success"]:
      raise IllegalGitOperation("Could not check remote.")

    try:
      return re.findall("^[\w/]+", cmd_ls["stdout"])[0]
    except IndexError:
      return None

  def fetch(self):
    cmd_fetch = call_command("git fetch %s" % self.name)
    if not cmd_fetch["success"]:
      raise IllegalGitOperation("Error while fetching %s" % self.name)
    return True

  def commit_log(self, remote_branch="master", local_branch=None):
    if not remote_branch and not local_branch:
      raise IllegalGitOperation("Must supply remote branch name")

    if not local_branch:
      local_branch = ""
    spec = "%s/%s..%s" % (self.name, remote_branch, local_branch)

    cmd_log = call_command("git log --oneline %s" % spec)
    if not cmd_log["success"]:
      raise IllegalGitOperation("Could not run git-log for %s" % spec)

    lines = cmd_log["stdout"].split("\n")
    commits = []
    for line in lines:
      commit = re.match("^(\w+)\s+(.*)$", line)
      if commit:
        commits.append(commit.groups())

    return commits

  def up_to_date(self, remote_branch="master", local_branch=None):
    return not self.commit_log(remote_branch, local_branch)

class Repository(object):
  def __init__(self, owner, repository, remotes=("origin", "upstream")):
    self.owner = owner
    self.repository = repository
    self.canonical = None

    self.remotes = {}
    self._detect_repository(remotes)

  @property
  def true_origin(self):
    return "%s/%s.git" % (self.owner, self.repository)

  @property
  def origin_url(self):
    return "git@github.com:%s" % self.true_origin

  def _detect_repository(self, remotes):
    """Detect the origin and upstream remotes in this repository."""
    for remote in remotes:
      rem = self._detect_remote(remote)
      if rem:
        self.remotes[remote] = rem
        if rem.canonical:
          self.canonical = rem

    if not self.canonical:
      self._configure_upstream()

  def _detect_remote(self, remote_name):
    """Detect a remote in this repository."""
    cmd_config = call_command("git config remote.%s.url" % remote_name)
    if not cmd_config["success"]:
      return None
    else:
      url = cmd_config["stdout"].strip()
      canonical = re.search(self.true_origin, url)
      return Remote(remote_name, url, canonical)

  def _configure_upstream(self):
    if self.canonical:
      return self.canonical

    cmd_add = call_command("git remote add %s %s" % (self.upstream,
      self.origin_url))
    if not cmd_add["success"]:
      raise IllegalGitOperation("Could not create %s remote." % self.upstream)
    else:
      remote = self._detect_remote(self.upstream)
      self.canonical = remote
      return remote

def pf(*args, **kwargs):
  print pprint.pformat(*args, **kwargs)

def call_command(command):
  print command
  process = subprocess.Popen(shlex.split(command), stdout=subprocess.PIPE,
      stderr=subprocess.PIPE)

  stdout, stderr = process.communicate()
  success = (process.returncode == 0)
  return dict(zip(["stdout", "stderr", "success"], [stdout, stderr, success]))

def main():
  repo = Repository("SegFaultAX", "vim-dotfiles")
  pf(repo.canonical.up_to_date())

if __name__ == "__main__":
  main()
