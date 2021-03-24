"""Adds repostories/archives needed by libevent."""

########################################################################
# DO NOT EDIT THIS FILE unless you are inside the
# https://github.com/3rdparty/bazel-rules-libevent repository. If you
# encounter it anywhere else it is because it has been copied there in
# order to simplify adding transitive dependencies. If you want a
# different version of stout follow the Bazel build instructions at
# https://github.com/3rdparty/bazel-rules-libevent.
########################################################################

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def libevent_load():
    if "rules_foreign_cc" not in native.existing_rules():
        http_archive(
            name = "rules_foreign_cc",
            url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.2.0.tar.gz",
            sha256 = "d54742ffbdc6924f222d2179f0e10e911c5c659c4ae74158e9fe827aad862ac6",
            strip_prefix = "rules_foreign_cc-0.2.0",
)

    if "com_github_3rdparty_bazel_rules_libevent" not in native.existing_rules():
        git_repository(
            name = "com_github_3rdparty_bazel_rules_libevent",
            commit = "69ae155d5218385045d42994694f0a6d90cbc5ef",
            remote = "https://github.com/3rdparty/bazel-rules-libevent",
            shallow_since = "1616530785 -0700",
        )
