// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IndexController on _IndexControllerBase, Store {
  final _$filePathAtom = Atom(name: '_IndexControllerBase.filePath');

  @override
  String get filePath {
    _$filePathAtom.reportRead();
    return super.filePath;
  }

  @override
  set filePath(String value) {
    _$filePathAtom.reportWrite(value, super.filePath, () {
      super.filePath = value;
    });
  }

  final _$loadingAtom = Atom(name: '_IndexControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isPlayingAtom = Atom(name: '_IndexControllerBase.isPlaying');

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  final _$sendAsyncAction = AsyncAction('_IndexControllerBase.send');

  @override
  Future<void> send() {
    return _$sendAsyncAction.run(() => super.send());
  }

  final _$playAsyncAction = AsyncAction('_IndexControllerBase.play');

  @override
  Future<void> play() {
    return _$playAsyncAction.run(() => super.play());
  }

  final _$stopAsyncAction = AsyncAction('_IndexControllerBase.stop');

  @override
  Future<void> stop() {
    return _$stopAsyncAction.run(() => super.stop());
  }

  @override
  String toString() {
    return '''
filePath: ${filePath},
loading: ${loading},
isPlaying: ${isPlaying}
    ''';
  }
}
