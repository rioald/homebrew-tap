# rioald Homebrew Tap

rioald의 앱을 설치하는 Homebrew 저장소입니다.

## gkdl 설치

[gkdl · 하이](https://github.com/rioald/gkdl)는 macOS 한영 전환과 단축키 오입력 교정 **아차차**를 제공하는 메뉴 막대 앱입니다.

```sh
brew install --cask rioald/tap/gkdl
```

macOS 13 Ventura 이상에서 Apple Silicon과 Intel을 지원합니다.

기존 gksdud는 먼저 정상 종료한 뒤 gkdl을 실행하세요. 메뉴 막대의 **하이 / gkdl → 설정**을 열고, **시스템 설정 → 개인정보 보호 및 보안 → 손쉬운 사용**에서 gkdl을 허용하세요. gkdl 설정으로 돌아와 **활성화**를 켜고, 원하는 한영 전환 키와 아차차를 설정하세요.

같은 버전의 공식 ZIP으로 이미 설치했다면 기존 앱을 Homebrew 관리에 편입할 수 있습니다.

```sh
brew install --cask --adopt rioald/tap/gkdl
```

기존 앱의 소유 그룹을 Homebrew에 맞추는 과정에서 관리자 암호가 필요할 수 있습니다. macOS의 **앱 관리** 권한은 관리자 인증과 별개이며, `sudo`로도 대신할 수 없습니다.

### `chgrp: Operation not permitted` 오류가 발생하면

`/Applications/gkdl.app`에 대해 이 오류가 발생하면, 명령을 실행한 터미널 앱의 **앱 관리** 권한을 확인하세요.

1. **시스템 설정 → 개인정보 보호 및 보안 → 앱 관리**를 엽니다.
2. **터미널(Terminal)**을 켭니다. iTerm이나 다른 앱의 내장 터미널에서 실행했다면 해당 앱을 허용하세요. 목록에 없으면 `+`로 추가합니다.
3. macOS가 요청하면 관리자 인증을 완료하고, 터미널 재시작 안내가 표시되면 작업을 저장한 뒤 따릅니다.
4. 같은 터미널에서 `brew install --cask --adopt rioald/tap/gkdl`을 다시 실행합니다.

이는 Homebrew가 기존 앱을 관리하기 위한 권한입니다. gkdl의 키보드 기능에 필요한 **손쉬운 사용** 권한과는 별개입니다. [Apple의 앱 관리 권한 안내](https://support.apple.com/ko-kr/guide/mac-help/mchl211c911f/mac)를 참고하세요.

## 업데이트와 삭제

gkdl의 앱 내 업데이트를 사용할 수 있습니다. Homebrew로 업데이트하려면 다음을 실행하세요.

```sh
brew update
brew upgrade --cask --greedy rioald/tap/gkdl
```

앱 자체 업데이트를 지원하므로 일반 일괄 업그레이드에서는 제외됩니다. `--greedy`는 해당 Cask도 업데이트 대상으로 포함합니다.

삭제 전에는 메뉴에서 gkdl을 정상 종료해 키보드 설정을 복원하세요. 다음 명령은 앱을 삭제하고 사용자 설정은 남깁니다.

```sh
brew uninstall --cask gkdl
```

## Cask 유지보수

1. gkdl의 새 릴리스를 서명·공증하고 공개 ZIP과 체크섬을 검증합니다.
2. `Casks/gkdl.rb`의 `version`과 `sha256`을 갱신합니다. `sha256 :no_check`는 사용하지 않습니다.
3. Homebrew 검증 후 변경을 커밋하고 이 저장소에 푸시합니다.

```sh
brew style --cask rioald/tap/gkdl
brew audit --cask --strict --online rioald/tap/gkdl
brew livecheck --cask rioald/tap/gkdl
brew fetch --cask rioald/tap/gkdl
```

`livecheck`는 최신 정식 릴리스를 확인합니다. 새 릴리스가 생겨도 Cask 파일이 자동으로 갱신되지는 않습니다.

이 저장소의 Cask 정의는 [MIT License](LICENSE)로 배포합니다. 각 앱의 라이선스는 해당 프로젝트를 따릅니다.
