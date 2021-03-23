"""Dependency specific initialization for stout."""

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

def libevent_deps():
    rules_foreign_cc_dependencies()

    # NOTE: can not try and add libevent until ***after*** we have
    # done `rules_foreign_cc_dependencies()` above.
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
