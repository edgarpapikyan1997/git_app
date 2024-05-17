// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_animation_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SuggestionAnimationState on _SuggestionAnimationState, Store {
  late final _$isOpenedAtom =
      Atom(name: '_SuggestionAnimationState.isOpened', context: context);

  @override
  bool get isOpened {
    _$isOpenedAtom.reportRead();
    return super.isOpened;
  }

  @override
  set isOpened(bool value) {
    _$isOpenedAtom.reportWrite(value, super.isOpened, () {
      super.isOpened = value;
    });
  }

  late final _$containerHeightAtom =
      Atom(name: '_SuggestionAnimationState.containerHeight', context: context);

  @override
  double get containerHeight {
    _$containerHeightAtom.reportRead();
    return super.containerHeight;
  }

  @override
  set containerHeight(double value) {
    _$containerHeightAtom.reportWrite(value, super.containerHeight, () {
      super.containerHeight = value;
    });
  }

  late final _$_SuggestionAnimationStateActionController =
      ActionController(name: '_SuggestionAnimationState', context: context);

  @override
  void openContainer() {
    final _$actionInfo = _$_SuggestionAnimationStateActionController
        .startAction(name: '_SuggestionAnimationState.openContainer');
    try {
      return super.openContainer();
    } finally {
      _$_SuggestionAnimationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeContainer() {
    final _$actionInfo = _$_SuggestionAnimationStateActionController
        .startAction(name: '_SuggestionAnimationState.closeContainer');
    try {
      return super.closeContainer();
    } finally {
      _$_SuggestionAnimationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOpened: ${isOpened},
containerHeight: ${containerHeight}
    ''';
  }
}
