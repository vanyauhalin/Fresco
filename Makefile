.PHONY: analyze build ci clean dev fixtures help install lint test version

define check_tuist
	if ! command -v tuist > /dev/null; then \
		echo "Tuist is not installed, please visit https://tuist.io to see how to install it." \
		exit 1; \
	fi
endef

help:
	@echo "Welcome to vanyauhalin/fresco sources."
	@echo ""
	@echo "Usage: make <subcommand>"
	@echo ""
	@echo "Subcommands:"
	@echo "  analyze     Analyze the project via SwiftLint."
	@echo "  build       Build the project via Tuist."
	@echo "  ci          Install only production dependencies via Tuist."
	@echo "  clean       Clean generated Tuist files except for dependencies."
	@echo "  dev         Generate a development workspace via Tuist."
	@echo "  fixtures    Build the fixtures via Tuist."
	@echo "  help        Show this message."
	@echo "  install     Install dependencies via Tuist."
	@echo "  lint        Lint the project and Tuist directory via SwiftLint."
	@echo "  test        Test the project via Tuist."
	@echo "  version     Print the current project version."

analyze:
	@$(call check_tuist)
	@tuist generate -n FrescoFramework
	@xcodebuild \
		-workspace Fresco.xcworkspace \
		-scheme FrescoFramework \
		CODE_SIGN_IDENTITY="" \
		CODE_SIGNING_REQUIRED=NO \
		> xcodebuild.log
	@xcrun \
		--sdk macosx \
		swift run \
			--package-path Tuist/Dependencies/SwiftPackageManager \
			--skip-build \
				swiftlint analyze \
					--config .swiftlint.yml \
					--compiler-log-path xcodebuild.log

build:
	@$(call check_tuist)
	@tuist generate -n fresco
	@tuist build fresco --build-output-path .build

ci: export TUIST_CI = true
ci:
	@$(call check_tuist)
	@tuist fetch

clean:
	@rm -rf \
		*.xcodeproj \
		*.xcworkspace \
		.build \
		Derived \
		xcodebuild.log \
		Fixtures/RegularApplication/*.xcodeproj \
		Fixtures/RegularApplication/*.xcworkspace \
		Fixtures/RegularApplication/.build \
		Fixtures/RegularApplication/Derived

dev:
	@$(call check_tuist)
	@tuist generate FrescoFramework FrescoTests

fixtures:
	@$(call check_tuist)
	@tuist build \
		-p Fixtures/RegularApplication \
		--build-output-path Fixtures/RegularApplication/.build
	@mv -f \
		Fixtures/RegularApplication/.build/Debug/RegularApplication.app \
		Fixtures/RegularApplication.app
	@cp -r Fixtures/RegularApplication.app Fixtures/SystemApplication.app
	@chown root:wheel Fixtures/SystemApplication.app

install:
	@$(call check_tuist)
	@tuist fetch
	@xcrun \
		--sdk macosx \
		swift build \
			--package-path Tuist/Dependencies/SwiftPackageManager \
			--product swiftlint

lint:
	@if \
		! xcrun \
			--sdk macosx \
			swift run \
				--package-path Tuist/Dependencies/SwiftPackageManager \
				--skip-build \
					swiftlint lint \
						--config .swiftlint.yml \
						. \
		2> /dev/null; \
	then \
		echo "warning: SwiftLint not installed, please execute make at the root of the project to see how to install it."; \
	fi

test:
	@$(call check_tuist)
	@tuist test

version:
	@echo "0.1.2"
