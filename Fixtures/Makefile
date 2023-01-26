.PHONY: build clean help

define check_tuist
	if ! command -v tuist > /dev/null; then \
		echo "Tuist is not installed, please visit https://tuist.io to see how to install it." \
		exit 1; \
	fi
endef

define build
	tuist build \
		-p $(1) \
		--clean \
		--build-output-path $(1)/.build
endef

define clean
	rm -rf \
		$(1)/*.xcodeproj \
		$(1)/*.xcworkspace \
		$(1)/.build \
		$(1)/Derived \
		$(1)/xcodebuild.log
endef

help:
	@echo "Welcome to vanyauhalin/fresco fixtures."
	@echo ""
	@echo "Usage: make <subcommand>"
	@echo ""
	@echo "Subcommands:"
	@echo "  build       Build the fixtures via Tuist. (sudo required)"
	@echo "  clean       Clean generated Tuist files."
	@echo "  help        Show this message."

build:
	@$(call check_tuist)
	@$(call build,RegularApplication)
	@mv -f \
		RegularApplication/.build/Debug/RegularApplication.app \
		RegularApplication.app
	@cp -r RegularApplication.app SystemApplication.app
	@chown root:wheel SystemApplication.app

clean:
	@$(call clean,RegularApplication)
