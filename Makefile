ifeq ($(OS),Windows_NT)
	GRADLEW = gradlew.bat
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		DIRECTORY_WATCHER = ./directory-watcher-windows-amd64.exe
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		DIRECTORY_WATCHER = ./directory-watcher-windows-386.exe
	endif
else
	GRADLEW = ./gradlew
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		UNAME_M := $(shell uname -m)
		ifeq ($(UNAME_M),aarch64)
			DIRECTORY_WATCHER = ./directory-watcher-linux-arm64
		else ifeq ($(UNAME_M),arm64)
			DIRECTORY_WATCHER = ./directory-watcher-linux-arm64
		else
			DIRECTORY_WATCHER = ./directory-watcher-linux-amd64
		endif
	endif
	ifeq ($(UNAME_S),Darwin)
		DIRECTORY_WATCHER = ./directory-watcher-macos-amd64
	endif
endif

.PHONY:init
init:
	(cd react_dev && ./cmd.sh init)
	(cd angular_dev && ./cmd.sh init)

.PHONY:watch
watch:
	${DIRECTORY_WATCHER} -c config-watch.yml

.PHONY:run
run:
	${DIRECTORY_WATCHER} -c config-once.yml

.PHONY:up
up:
	(cd spring_dev && ./cmd.sh build)
	(cd react_dev && ./cmd.sh build)
	(cd go_dev && ./cmd.sh build)
	(cd angular_dev && ./cmd.sh build)
	./cmd.sh up

.PHONY:down
down:
	./cmd.sh down

.PHONY:log
log:
	./cmd.sh log
