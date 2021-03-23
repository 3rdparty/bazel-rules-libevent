load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def libevent_deps():
    if "com_github_libevent_libevent" not in native.existing_rules():
        http_archive(
            name = "com_github_libevent_libevent",
            url = "https://github.com/libevent/libevent/archive/release-2.1.8-stable.zip",
            sha256 = "70158101eab7ed44fd9cc34e7f247b3cae91a8e4490745d9d6eb7edc184e4d96",
            strip_prefix = "libevent-release-2.1.8-stable",
            build_file = "@com_github_3rdparty_bazel_rules_libevent//:libevent.BUILD",
        )
