workspace(name = "protoconf")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "a82a352bffae6bee4e95f68a8d80a70e87f42c4741e6a448bec11998fcc82329",
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/0.18.5/rules_go-0.18.5.tar.gz"],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

http_archive(
    name = "bazel_gazelle",
    sha256 = "3c681998538231a2d24d0c07ed5a7658cb72bfb5fd4bf9911157c0e9ac6a2687",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/0.17.0/bazel-gazelle-0.17.0.tar.gz"],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

gazelle_dependencies()

go_repository(
    name = "com_github_docker_libkv",
    commit = "458977154600b9f23984d9f4b82e79570b5ae12b",
    importpath = "github.com/docker/libkv",
)

# Implicitly used by libkv
go_repository(
    name = "com_github_hashicorp_consul",
    importpath = "github.com/hashicorp/consul",
    tag = "v1.0.7",
)

go_repository(
    name = "com_github_jhump_protoreflect",
    commit = "af618f5b4cc4a322d8e8e99a568d6d41a574ee18",
    importpath = "github.com/jhump/protoreflect",
)

go_repository(
    name = "net_starlark_go",
    commit = "24246af8ff5f56427b506403ba62aadbcf5413a0",
    importpath = "go.starlark.net",
)

go_repository(
    name = "com_github_fsnotify_fsnotify",
    commit = "1d13583d846ea9d66dcabbfefbfb9d8e6fb05216",
    importpath = "github.com/fsnotify/fsnotify",
)

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "com_github_golang_protobuf",
    commit = "c823c79ea1570fb5ff454033735a8e68575d1d0f",  # v1.3.0, as of 2019-03-03
    patch_args = ["-p1"],
    patches = [
        "com_github_golang_protobuf-gazelle.patch",
        "@io_bazel_rules_go//third_party:com_github_golang_protobuf-extras.patch",
        "protobuf_fix_any_indentation.patch",
    ],
    remote = "https://github.com/golang/protobuf",
    shallow_since = "1549405252 -0800",
)
# gazelle args: -go_prefix github.com/golang/protobuf -proto disable_global

go_rules_dependencies()

go_register_toolchains()