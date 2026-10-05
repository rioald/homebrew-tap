# TWENTYOZ Homebrew Tap

TWENTYOZ 앱을 설치하는 Homebrew 저장소입니다.

## gkdl 설치

[gkdl · 하이](https://github.com/rioald/gkdl)는 macOS 한영 전환과 단축키 오입력 교정 **아차차**를 제공하는 메뉴 막대 앱입니다.

```sh
brew install --cask rioald/tap/gkdl
```

macOS 13 Ventura 이상에서 Apple Silicon과 Intel을 지원합니다. Cask는 TWENTYOZ Developer ID 서명과 Apple 공증을 마친 공식 릴리스 ZIP을 내려받고 SHA-256을 검증합니다.

설치 후 gkdl을 열고 **시스템 설정 → 개인정보 보호 및 보안 → 손쉬운 사용**에서 접근성 권한을 허용하세요. 기존 gksdud는 먼저 정상 종료하고, gkdl 설정에서 원하는 한영 전환 키와 아차차를 켜세요.

같은 버전의 공식 ZIP으로 이미 설치했다면 기존 앱을 Homebrew 관리에 편입할 수 있습니다.

```sh
brew install --cask --adopt rioald/tap/gkdl
```

기존 앱의 소유 그룹을 Homebrew에 맞추는 과정에서 관리자 암호가 필요할 수 있으므로, 편입 명령은 Mac의 터미널에서 실행하세요.

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
