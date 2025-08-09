.PHONY: go-bindings
go-bindings:
	@echo "'go_bindings.log' created"
	@go tool wit-bindgen-go generate --out internal ./wit > go_bindings.log 2>&1 || true

# This is me messing around with a local build of `wit-bindgen-go`,
# so this won't work unless you build locally and create a symlink named `wit-bindgen-go-canary`
.PHONY: canary
canary:
	@echo "'canary.log' created"
	@./wit-bindgen-go-canary generate --out internal ./wit > canary.log 2>&1 || true