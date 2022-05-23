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
		DIRECTORY_WATCHER = ./directory-watcher-linux-amd64
	endif
	ifeq ($(UNAME_S),Darwin)
		DIRECTORY_WATCHER = ./directory-watcher-macos-amd64
	endif
endif

init:
	(cd react_dev && ./cmd.sh init)

watch:
	${DIRECTORY_WATCHER} -c config-watch.yml

run:
	${DIRECTORY_WATCHER} -c config-once.yml

up:
	(cd spring_dev && ./cmd.sh build)
	(cd react_dev && ./cmd.sh build)
	./cmd.sh up

down:
	./cmd.sh down

log:
	./cmd.sh log
