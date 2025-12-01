## Quick context

This is a stock Flutter app created with `flutter create` (single module app). The entry point is `lib/main.dart` (MaterialApp -> `MyHomePage`). The project targets mobile and desktop platforms — see `android/`, `ios/`, `linux/`, `macos/`, and `windows/` folders. Keep changes minimal and platform-aware.

## What to know first (big picture)

- App structure: UI lives under `lib/` (single entry `lib/main.dart`). Small, stateful example widget (`MyHomePage`) shows the coding style.
- Platform code: native runners and generated plugin registrants live in each `*/runner/` or `*/generated_plugin_registrant.*` (e.g., `linux/runner/main.cc`, `windows/runner/main.cpp`, `ios/Runner/`). Only touch when adding platform channels or native plugins.
- Build system: Android uses Gradle Kotlin DSL (`android/*.kts`). On Windows use `\.\gradlew.bat` to run Gradle tasks.

## Key workflows & commands (exact)

- Install deps: `flutter pub get`
- Run on attached device: `flutter run -d <device-id>` (or `flutter run`)
- Run tests: `flutter test` (runs `test/` unit/widget tests)
- Analyze: `flutter analyze`
- Format: `dart format .`
- Build release APK: `flutter build apk --release`
- Build iOS: `flutter build ipa` or use Xcode workspace at `ios/Runner.xcworkspace`
- On CI/Windows: run `.
  \gradlew.bat assembleRelease` from the project root for native Android tasks.

Hot reload: save files in supported IDE or press `r` in a terminal started with `flutter run`.
Hot restart: press `R` in the running terminal.

## Project-specific conventions & notes

- Lints: `analysis_options.yaml` is present — follow the project's lint set. Run `flutter analyze` before major PRs.
- Publishing: `pubspec.yaml` contains `publish_to: 'none'` — this app is not intended for pub.dev publishing.
- Versioning: change `version:` in `pubspec.yaml` for app version; Android/iOS also read platform manifests.
- Assets: none declared in `pubspec.yaml` by default. Add assets under `assets/` and register them in `pubspec.yaml`.
- Gradle files use Kotlin DSL (`.kts`) — be careful editing Kotlin script syntax vs classic Groovy.

## Integration & extension points (where to implement features)

- Add platform channel/native code: implement in the relevant platform runner folder (e.g., `android/app/src/main/java/...`, `ios/Runner/`, `linux/runner/`, `windows/runner/`). Keep plugin registration consistent with `generated_plugin_registrant.*` files.
- Add Dart libraries: place reusable code under `lib/src/` and expose from `lib/` if the project grows.

## Examples to reference in edits

- Entry point: `lib/main.dart` — follow this file's widget naming & state patterns for small features.
- Dependency management: `pubspec.yaml` — add packages here and run `flutter pub get`.
- Linting config: `analysis_options.yaml` — adjust only if necessary and run `flutter analyze`.

## Safety / do-not-change guidance

- Do not remove `publish_to: 'none'` unless you intend to publish.
- Avoid manual edits to generated platform registrant files unless implementing a plugin that requires it.

## When in doubt

- If a change affects native build files (Gradle, Xcode), run a local build (`flutter build apk` / open Xcode) before opening a PR.
- If a change touches CI or runner scripts, validate on the corresponding OS (Windows for `\.\gradlew.bat`, macOS for Xcode builds).

---

If any of these areas need more detail (specific CI steps, preferred code layout for larger features, or testing patterns), tell me which area to expand and I will update this guidance.
