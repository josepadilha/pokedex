abstract class TabBarState {
  int option;
  TabBarState({
    required this.option,
  });
}

class TabBarInitialState extends TabBarState {
  TabBarInitialState() : super(option: 0);
}

class TabBarSucessState extends TabBarState {
  TabBarSucessState({
    required int index,
  }) : super(option: index);
}
