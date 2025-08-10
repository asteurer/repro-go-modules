# Overview

This is reproducing an error when attempting to generate the Go bindings for `spinframework/spin-go-sdk/v3` with `wit-bindgen-go`.

```sh
$ make go-bindings
...
error: wasm-tools: error: The main package `wasi:clocks@0.2.0` contains no worlds
```

Something I noticed in the `go_bindings.log` file (output for `make go-bindings`): Both the `filesystem` package and the `io` package enclose their interfaces with brackets, while the `clocks` package ends with a semicolon and its corresponding interface is placed below it:
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

I tried manually creating the `wasi:clocks` package in `./component.wit` and tried inserting the file data in place of the `witText` variable [here](https://github.com/bytecodealliance/go-modules/blob/55a8715c694fb4bbe75c269ffd4a0ca14c80c6f1/wit/bindgen/generator.go#L2416); however, it then complains about not having a package header:
```
error: wasm-tools: error: no `package` header was found in any WIT file for this package
```

If I try to add a generic package header, we get another "package contains no worlds" error:
```
error: wasm-tools: error: The main package `foo:bar@0.0.0` contains no worlds
```

# Usage

## Requirements

- Go v1.24.5

## Generate the Go bindings

To generate the files you have two options:
- Run `make go-bindings`
- Run `go tool wit-bindgen-go generate --out internal ./wit`