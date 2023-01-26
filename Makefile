.PHONY: analyze build ci clean dev help install lint test version

project :=

define check_tuist
	if ! command -v tuist > /dev/null; then \
		echo "Tuist is not installed, please visit https://tuist.io to see how to install it." \
		exit 1; \
	fi
endef

define analyze
	xcodebuild \
		-workspace Fresco.xcworkspace \
		-scheme $(1) \
		-quiet \
		CODE_SIGN_IDENTITY="" \
		CODE_SIGNING_REQUIRED=NO \
		> xcodebuild.log
	xcrun \
		--sdk macosx \
		swift run \
			--package-path Tuist/Dependencies/SwiftPackageManager \
			--skip-build \
				swiftlint analyze \
					--config .swiftlint.yml \
					--compiler-log-path xcodebuild.log
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

define lint
	if \
		! xcrun \
			--sdk macosx \
			swift run \
				--package-path Tuist/Dependencies/SwiftPackageManager \
				--skip-build \
					swiftlint lint \
						--config .swiftlint.yml \
						$(1) \
		2> /dev/null; \
	then \
		echo "warning: SwiftLint not installed, please execute make at the root of the project to see how to install it."; \
	fi
endef

help:
	@echo "Welcome to vanyauhalin/fresco sources."
	@echo ""
	@echo "Usage: make <subcommand> [argument=value]"
	@echo "       make install"
	@echo "       make lint project=FrescoCLI"
	@echo ""
	@echo "Subcommands:"
	@echo "  analyze     Analyze the project via SwiftLint."
	@echo "  build       Build the project via Tuist."
	@echo "  ci          Install only production dependencies via Tuist."
	@echo "  clean       Clean generated Tuist files except for dependencies."
	@echo "  dev         Generate a development workspace via Tuist."
	@echo "  help        Show this message."
	@echo "  install     Install dependencies via Tuist."
	@echo "  lint        Lint the project and Tuist directory via SwiftLint."
	@echo "  test        Test the project via Tuist."
	@echo "  version     Print the current project version."
	@echo ""
	@echo "Arguments:"
	@echo "  project     Specify a project for the lint command."

analyze:
	@$(call check_tuist)
	@tuist generate -n
	@$(call analyze,FrescoCore)
	@$(call analyze,FrescoCLI)
	@$(call analyze,FrescoGUI)

build: export TUIST_ENVIRONMENT = production
build:
	@$(call check_tuist)
	@$(call build,FrescoCLI)
	@$(call build,FrescoGUI)

ci: export TUIST_ENVIRONMENT = ci
ci:
	@$(call check_tuist)
	@tuist fetch

clean:
	@$(call clean,FrescoCLI)
	@$(call clean,FrescoCore)
	@$(call clean,FrescoGUI)
	@$(call clean,.)

dev:
	@$(call check_tuist)
	@tuist generate

install:
	@$(call check_tuist)
	@tuist fetch
	@xcrun \
		--sdk macosx \
		swift build \
			--package-path Tuist/Dependencies/SwiftPackageManager \
			--product swiftlint

lint:
ifdef project
	@$(call lint,$(project))
else
	@$(call lint,.)
endif

test:
	@$(call check_tuist)
	@tuist test

version:
	@echo "0.1.2"
