ifeq ($(OS),Windows_NT)
DIRECTORY_WATCHER = directory-watcher-macos-amd64.exe
else
DIRECTORY_WATCHER = ./directory-watcher-macos-amd64
endif

run:
	${DIRECTORY_WATCHER} -c config.yml

up:
	./cmd.sh up

down:
	./cmd.sh down

log:
	./cmd.sh log
