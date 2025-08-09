# Overview

This is reproducing an error when attempting to generate the Go bindings for `spinframework/spin-go-sdk/v3` with `wit-bindgen-go`.

```sh
$ make go-bindings
...
error: wasm-tools: error: The main package `wasi:clocks@0.2.0` contains no worlds
```

Something I noticed in the `go_bindings.log` file (output for `make go-bindings`): Both the `filesystem` package and the `io` package encloses their interfaces with brackets, while the `clocks` package ends with a semicolon and its corresponding interface is placed below it:
```
package wasi:clocks@0.2.0;
<INTERFACES>

package wasi:filesystem@0.2.0 {
    <INTERFACES>
}

package wasi:io@0.2.0 {
    <INTERFACES>
}

```

# Usage

## Requirements

- Go v1.24.5

# Generate the Go bindings

To generate the files you have two options:
- Run `make go-bindings`
- Run `go tool wit-bindgen-go generate --out internal ./wit`