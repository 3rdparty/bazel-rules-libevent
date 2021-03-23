"""Adds repostories/archives needed by libevent."""

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
            commit = "4b3a44a1d5e9e0f2266f82e7b74f31e5e8e0e73e",
            remote = "https://github.com/3rdparty/bazel-rules-libevent",
            shallow_since = "1616530384 -0700",
        )
