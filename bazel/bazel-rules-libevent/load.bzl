"""Adds repostories/archives needed by libevent."""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def libevent_load():
    if "com_github_3rdparty_bazel_rules_libevent" not in native.existing_rules():
        git_repository(
            name = "com_github_3rdparty_bazel_rules_libevent",
            commit = "662849fb577ea9cce0ce39f1482250b38bff352e",
            remote = "https://github.com/3rdparty/bazel-rules-libevent",
            shallow_since = "1616529801 -0700",
        )

    if "rules_foreign_cc" not in native.existing_rules():
        http_archive(
            name = "rules_foreign_cc",
            url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.1.0.zip",
            sha256 = "c2cdcf55ffaf49366725639e45dedd449b8c3fe22b54e31625eb80ce3a240f1e",
            strip_prefix = "rules_foreign_cc-0.1.0",
        )
