# Overview

This is reproducing an error I'm encountering with `wit-bindgen-go` where the 0.6.2 release generates the Go bindings, while the 0.7.0 release does not.

## Notes

- `0.7.0.log` and `0.7.0_no_w_flag.log` are identical

- `0.7.0.log` and `0.6.2_no_w_flag.log` have different errors (relevant text is at the bottom of each file)

- `0.6.2.log` is empty because `make 0.6.2` generates the `internal/*` files

# Requirements

- Go v1.24.5 (optional)
- You can install the remaining tools by running `make install-tools`
    - If you would prefer not to use the Makefile, these are the tools you will need:
        - wit-bindgen-go v0.7.0 and v0.6.2

# Usage

To attempt to generate the files, you can run `make all`