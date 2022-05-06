abstract class TabBarEvent {
  int option;

  TabBarEvent({required this.option});
}

class GetOptionEvent extends TabBarEvent {
  GetOptionEvent() : super(option: 0);
}

class AlternationOptionEvent extends TabBarEvent {
  int optionToAlternation;

  AlternationOptionEvent({
    required this.optionToAlternation,
  }) : super(option: optionToAlternation);
}
