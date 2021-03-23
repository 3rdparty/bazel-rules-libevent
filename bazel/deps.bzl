"""Dependency specific initialization for stout."""

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def libevent_deps():
    rules_foreign_cc_dependencies()
