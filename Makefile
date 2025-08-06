.PHONY: all
all: 0.7.0 0.7.0-no-w-flag 0.6.2 0.6.2-no-w-flag

.PHONY: 0.7.0
0.7.0:
	@echo "'0.7.0.log' created"
	@./wit-bindgen-go-0.7.0 generate -w http-trigger --out internal ./wit > 0.7.0.log 2>&1 || true

.PHONY: 0.7.0-no-w-flag
0.7.0-no-w-flag:
	@echo "'0.7.0_no_w_flag.log' created"
	@./wit-bindgen-go-0.7.0 generate --out internal ./wit > 0.7.0_no_w_flag.log 2>&1 || true

.PHONY: 0.6.2
0.6.2:
	@echo "'0.6.2.log' created"
	@./wit-bindgen-go-0.6.2 generate -w http-trigger --out internal ./wit > 0.6.2.log 2>&1 || true

.PHONY: 0.6.2-no-w-flag
0.6.2-no-w-flag:
	@echo "'0.6.2_no_w_flag.log' created"
	@./wit-bindgen-go-0.6.2 generate --out internal ./wit > 0.6.2_no_w_flag.log 2>&1 || true

.PHONY: install-tools
install-tools:
	@echo "Install wit-bindgen-go v0.7.0"
	@wget https://github.com/bytecodealliance/go-modules/releases/download/v0.7.0/wit-bindgen-go-linux-amd64.tgz > /dev/null 2>&1
	@tar -xf wit-bindgen-go-linux-amd64.tgz
	@mv wit-bindgen-go wit-bindgen-go-0.7.0
	@rm wit-bindgen-go-linux-amd64.tgz

	@echo "Install wit-bindgen-go v0.6.2"
	@wget https://github.com/bytecodealliance/go-modules/releases/download/v0.6.2/wit-bindgen-go-linux-amd64.tgz > /dev/null 2>&1
	@tar -xf wit-bindgen-go-linux-amd64.tgz
	@mv wit-bindgen-go wit-bindgen-go-0.6.2
	@rm wit-bindgen-go-linux-amd64.tgz