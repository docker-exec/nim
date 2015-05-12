# Docker Exec Image: Nim

A Dockerfile describing an container capable of executing Nim source files.

# Build

```sh
git clone https://github.com/docker-exec/nim.git
docker build -t dexec/lang-nim .
```

# Usage

In a directory containing a script e.g. foo.nim, run:

```sh
docker run -t --rm \
    -v $(pwd -P)/foo.nim:/tmp/dexec/build/foo.nim \
    dexec/lang-nim foo.nim
```

## Passing arguments to the script

Arguments can be passed to the script using any of the following forms:

```
-a argument
--arg argument
--arg=argument
```

Each argument passed must be prefixed in this way, e.g.

```sh
docker run -t --rm \
    -v $(pwd -P)/foo.nim:/tmp/dexec/build/foo.nim \
    dexec/lang-nim foo.nim \
    --arg='hello world' \
    --arg=foo \
    --arg=bar
```

## Passing arguments to the compiler

Arguments can be passed to the compiler using any of the following forms:

```
-b argument
--build-arg argument
--build-arg=argument
```

Each argument passed must be prefixed in this way, e.g.

```sh
docker run -t --rm \
    -v $(pwd -P)/foo.nim:/tmp/dexec/build/foo.nim \
    dexec/lang-nim foo.nim \
    --build-arg=-some-compiler-option \
    --build-arg=some-compiler-option-value
```
