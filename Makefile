all: clean-build

clean-build: clean build

build:
	@echo "[BUILD] GEAS Experiment."
	cargo build

clean:
	@echo "[CLEAN] GEAS Experiment."
	cargo clean

ci: clean-build
	@echo "[CI] GEAS Experiment."
	# $(MAKE) clean
	cargo test
	git status

mistakes: clean-build
	@echo "[MISTAKES] GEAS Experiment."
	cargo check
	git status

deploy:
	@echo "[DEPLOY] GAES Experiment."
	# Configure AWS CDK/CLI
	# cargo install cargo-aws-lambda
	# cargo aws-lambda {your aws function's full ARN} {your-binary-name}