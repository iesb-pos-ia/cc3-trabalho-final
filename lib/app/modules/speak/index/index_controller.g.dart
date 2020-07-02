// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IndexController on _IndexControllerBase, Store {
  final _$isRecordingAtom = Atom(name: '_IndexControllerBase.isRecording');

  @override
  bool get isRecording {
    _$isRecordingAtom.reportRead();
    return super.isRecording;
  }

  @override
  set isRecording(bool value) {
    _$isRecordingAtom.reportWrite(value, super.isRecording, () {
      super.isRecording = value;
    });
  }

  final _$hasPermissionAtom = Atom(name: '_IndexControllerBase.hasPermission');

  @override
  bool get hasPermission {
    _$hasPermissionAtom.reportRead();
    return super.hasPermission;
  }

  @override
  set hasPermission(bool value) {
    _$hasPermissionAtom.reportWrite(value, super.hasPermission, () {
      super.hasPermission = value;
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

  final _$initializingAtom = Atom(name: '_IndexControllerBase.initializing');

  @override
  bool get initializing {
    _$initializingAtom.reportRead();
    return super.initializing;
  }

  @override
  set initializing(bool value) {
    _$initializingAtom.reportWrite(value, super.initializing, () {
      super.initializing = value;
    });
  }

  final _$alternativesAtom = Atom(name: '_IndexControllerBase.alternatives');

  @override
  List<AlternativeModel> get alternatives {
    _$alternativesAtom.reportRead();
    return super.alternatives;
  }

  @override
  set alternatives(List<AlternativeModel> value) {
    _$alternativesAtom.reportWrite(value, super.alternatives, () {
      super.alternatives = value;
    });
  }

  final _$checkRecordPermissionAsyncAction =
      AsyncAction('_IndexControllerBase.checkRecordPermission');

  @override
  Future<void> checkRecordPermission() {
    return _$checkRecordPermissionAsyncAction
        .run(() => super.checkRecordPermission());
  }

  final _$onRecordAsyncAction = AsyncAction('_IndexControllerBase.onRecord');

  @override
  Future<void> onRecord() {
    return _$onRecordAsyncAction.run(() => super.onRecord());
  }

  final _$onStopAsyncAction = AsyncAction('_IndexControllerBase.onStop');

  @override
  Future<void> onStop() {
    return _$onStopAsyncAction.run(() => super.onStop());
  }

  @override
  String toString() {
    return '''
isRecording: ${isRecording},
hasPermission: ${hasPermission},
loading: ${loading},
initializing: ${initializing},
alternatives: ${alternatives}
    ''';
  }
}
