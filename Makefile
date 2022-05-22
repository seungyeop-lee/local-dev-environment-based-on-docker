ifeq ($(OS),Windows_NT)
	DIRECTORY_WATCHER = directory-watcher-windows-amd64.exe
	GRADLEW = gradlew.bat
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		DIRECTORY_WATCHER = ./directory-watcher-linux-amd64
		GRADLEW = ./gradlew
	endif
	ifeq ($(UNAME_S),Darwin)
		DIRECTORY_WATCHER = ./directory-watcher-macos-amd64
		GRADLEW = ./gradlew
	endif
endif

watch:
	${DIRECTORY_WATCHER} -c config-watch.yml

run:
	${DIRECTORY_WATCHER} -c config-once.yml

up:
	(cd spring_dev && ${GRADLEW} build -x test)
	./cmd.sh up

down:
	./cmd.sh down

log:
	./cmd.sh log
