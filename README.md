# local-dev-environment-based-on-docker

로컬개발 환경과 배포 환경을 동일하게하여, 환경에 의한 오류를 최소화하는 것을 목표로하는 로컬 개발환경을 만드는 것이 목적이다.

docker-compose를 사용하여 배포하는 환경을 가정하였으며, 로컬 개발 환경에서도 동일한 컨테이너가 구동되도록 구성하였다.

코드 변경을 감지하여 바로 적용하기 위해 [directory-watcher](https://github.com/seungyeop-lee/directory-watcher)를 사용하였다. 
변경 적용 속도를 향상 시키기 위해 로컬 빌드 후, 실행파일만 컨테이너화하도록 구성하여 캐쉬를 최대한 활용하도록 하였다.

## 필요사항

- docker
- jdk 17+
- node 18+
- golang 1.19+

## 실행법

### 1. 초기화

```bash
$ bash cmd.sh init
```

### 2. 실행 - 기동모드

```bash
# MacOS
$ ./directory-watcher/directory-watcher-macos-amd64 -c config-run.yml
# Ctrl + C 로 종료
```
```bash
# WSL2
$ ./directory-watcher/directory-watcher-linux-amd64 -c config-run.yml
# Ctrl + C 로 종료
```
```bash
# Git Bash
$ ./directory-watcher/directory-watcher-windows-amd64.exe -c config-run.yml
# Ctrl + C 로 종료
```

### 2. 실행 - 감시모드

```bash
# MacOS
$ ./directory-watcher/directory-watcher-macos-amd64 -c config-watch.yml
# Ctrl + C 로 종료
```
```bash
# WSL2
$ ./directory-watcher/directory-watcher-linux-amd64 -c config-watch.yml
# Ctrl + C 로 종료
```
```bash
# Git Bash
$ ./directory-watcher/directory-watcher-windows-amd64.exe -c config-watch.yml
# Ctrl + C 로 종료
```

### 3. 컨테이너 내부 로그 확인

```bash
$ bash cmd.sh log
# Ctrl + C 로 종료
```

### 4. 테스트 Endpoint

- react: https://localhost/react-dev
- spring: https://localhost/spring-dev/hello-view/world 
- golang: https://localhost/go-dev/ping 

## 확인 OS

- MacOS
- Windows WSL2
- Windows Git Bash
