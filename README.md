# Just One Ten Mins

책과 PDF 파일을 10분 분량의 오디오 요약본으로 변환해주는 모바일 애플리케이션입니다.

## 주요 기능

### 📚 콘텐츠 업로드
- PDF 파일 업로드 지원
- 책 스캔 기능
- 텍스트 추출 및 처리

### 🤖 AI 요약
- 핵심 내용 추출
- 10분 분량으로 자동 요약
- 주요 포인트 하이라이트

### 🎧 오디오 변환
- 텍스트를 자연스러운 음성으로 변환
- 고품질 TTS(Text-to-Speech) 지원
- 다양한 음성 옵션 제공

### ▶️ 오디오북 재생
- 직관적인 오디오 플레이어
- 재생 속도 조절
- 구간 반복 기능

### 📱 라이브러리 관리
- 업로드한 콘텐츠 관리
- 생성된 오디오북 보관
- 즐겨찾기 및 카테고리 분류

## 기술 스택

### 프레임워크 & 언어
- Flutter
- Dart

### 주요 패키지
- `flutter_riverpod`: 상태 관리
- `just_audio`: 오디오 재생
- `flutter_tts`: 텍스트 음성 변환
- `file_picker`: 파일 선택
- `pdf_text`: PDF 처리
- `isar`: 로컬 데이터베이스

## 시작하기

### 필수 조건
- Flutter SDK 3.19.0 이상
- Dart SDK 3.3.0 이상
- Android Studio 또는 VS Code

### 설치 방법
1. 저장소 클론
```bash
git clone https://github.com/yourusername/just_one_ten_mins.git
```

2. 의존성 설치
```bash
flutter pub get
```

3. 프로젝트 실행
```bash
flutter run
``` 
## 프로젝트 구조
```bash
lib/
├── core/ # 핵심 유틸리티 및 상수
├── features/ # 주요 기능별 모듈
│ ├── auth/
│ ├── book_management/
│ ├── summary/
│ └── audio_player/
└── l10n/ # 다국어 지원
```

## 기여하기
프로젝트에 기여하고 싶으시다면 다음 절차를 따라주세요:
1. 이슈 생성
2. 브랜치 생성
3. 변경사항 커밋
4. Pull Request 제출

## 라이선스
이 프로젝트는 MIT 라이선스를 따릅니다.