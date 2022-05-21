ifeq ($(OS),Windows_NT)
DIRECTORY_WATCHER = directory-watcher-macos-amd64.exe
GRADLEW = gradlew.bat
else
DIRECTORY_WATCHER = ./directory-watcher-macos-amd64
GRADLEW = ./gradlew
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
