# Bazel build rules for libevent

Follows the Bazel build "load/deps" pattern (in order to deal with recursive dependencies). To use:

(1) Copy the directory `./bazel/bazel-rules-libevent` into your repository.

(2) Add the following to your `WORKSPACE` (or `WORKSPACE.bazel`):

  ```bazel
  load("//bazel/bazel-rules-libevent:load.bzl", "libevent_load")

  libevent_load()

  load("@com_github_3rdparty_bazel_rules_libevent//bazel:deps.bzl", "libevent_deps")

  libevent_deps()
  ```

(3) You can then use `@com_github_libevent_libevent//:event` in your target's `deps`.

(4) Repeat the steps starting at (1) at the desired version of this repository that you want to use.