import 'package:mobx/mobx.dart';

part 'suggestion_animation_state.g.dart';

class SuggestionAnimationState = _SuggestionAnimationState with _$SuggestionAnimationState;

abstract class _SuggestionAnimationState with Store {

  @observable
  bool isOpened = false;

  @observable
  double containerHeight = 55;

  @action
  void openContainer() {
    containerHeight = 200;
  }

  @action
  void closeContainer() {
    containerHeight = 55;
  }
}