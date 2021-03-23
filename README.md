# Bazel build rules for libevent

To use these rules, add the following to your `WORKSPACE` file:

```bazel
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "com_github_3rdparty_bazel_rules_libevent",
    commit = "",
    remote = "https://github.com/3rdparty/bazel-rules-libvent",
    shallow_since = " -0700",
)

load("@com_github_3rdparty_bazel_rules_libevent//:bazel/libevent.bzl", "libevent_deps")

libevent_deps()
```

You can then use `@com_github_libevent_libevent//:libevent` in your target's `deps`.
