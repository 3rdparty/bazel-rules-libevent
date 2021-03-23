"""Adds repostories/archives needed by libevent."""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def libevent_load():
    if "com_github_3rdparty_bazel_rules_libevent" not in native.existing_rules():
        git_repository(
            name = "com_github_3rdparty_bazel_rules_libevent",
            commit = "1f481d9655cdd403307d51fd7d5a8c0f96589c4c",
            remote = "https://github.com/3rdparty/bazel-rules-libevent",
            shallow_since = "1616527405 -0700",
        )

    if "rules_foreign_cc" not in native.existing_rules():
        http_archive(
            name = "rules_foreign_cc",
            url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.1.0.zip",
            sha256 = "c2cdcf55ffaf49366725639e45dedd449b8c3fe22b54e31625eb80ce3a240f1e",
            strip_prefix = "rules_foreign_cc-0.1.0",
        )

    if "com_github_libevent_libevent" not in native.existing_rules():
        http_archive(
            name = "com_github_libevent_libevent",
            # This commit includes the new "prepare" and "check" watchers,
            # used for event loop performance stats (see
            # https://github.com/libevent/libevent/pull/793) and the fix
            # for a race condition in the watchers (see
            # https://github.com/libevent/libevent/pull/802). This also
            # includes the fixes for
            # https://github.com/libevent/libevent/issues/806.  This also
            # includes the fixes for Phantom events with EV_ET (see
            # https://github.com/libevent/libevent/issues/984). This also
            # includes the wepoll backend for Windows (see
            # https://github.com/libevent/libevent/pull/1006)
            # TODO(benh): Update to v2.2 when it is released.
            urls = ["https://github.com/libevent/libevent/archive/62c152d9a7cd264b993dad730c4163c6ede2e0a3.tar.gz"],
            sha256 = "4c80e5fe044ce5f8055b20a2f141ee32ec2614000f3e95d2aa81611a4c8f5213",
            strip_prefix = "libevent-62c152d9a7cd264b993dad730c4163c6ede2e0a3",
            build_file = "@com_github_3rdparty_bazel_rules_libevent//libevent:BUILD.bazel",
        )

