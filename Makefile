ifeq ($(OS),Windows_NT)
DIRECTORY_WATCHER = directory-watcher-macos-amd64.exe
else
DIRECTORY_WATCHER = ./directory-watcher-macos-amd64
endif

watch:
	${DIRECTORY_WATCHER} -c config-watch.yml

run:
	${DIRECTORY_WATCHER} -c config-once.yml -v

up:
	./cmd.sh up

down:
	./cmd.sh down

log:
	./cmd.sh log
