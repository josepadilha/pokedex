abstract class TabBarEvent {
  int option;

  TabBarEvent({required this.option});
}

class AlternationOptionEvent extends TabBarEvent {
  int optionToAlternation;

  AlternationOptionEvent({
    required this.optionToAlternation,
  }) : super(option: optionToAlternation);
}
