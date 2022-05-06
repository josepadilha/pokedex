class DropDownButtonState {
  List<String>? dropDownListAbility;
  List<String>? dropDownListCategory;
  List<String>? dropDownListType;

  DropDownButtonState({
    this.dropDownListAbility,
    this.dropDownListCategory,
    this.dropDownListType,
  });
}

class DropDownButtonLoadingState extends DropDownButtonState {
  List<String>? dropDownListAbility;
  List<String>? dropDownListCategory;
  List<String>? dropDownListType;

  DropDownButtonLoadingState({
    this.dropDownListAbility,
    this.dropDownListCategory,
    this.dropDownListType,
  }); // dúvida sobre o super.
}

class DropDownButtonInitialState extends DropDownButtonState {
  List<String>? dropDownListAbility;
  List<String>? dropDownListCategory;
  List<String>? dropDownListType;

  DropDownButtonInitialState({
    this.dropDownListAbility,
    this.dropDownListCategory,
    this.dropDownListType,
  }); // dúvida
}

class DropDownButtonSucessState extends DropDownButtonState {
  List<String>? dropDownListAbility;
  List<String>? dropDownListCategory;
  List<String>? dropDownListType;

  DropDownButtonSucessState(
      {required this.dropDownListCategory,
      required this.dropDownListAbility,
      required this.dropDownListType});

  /// dúvida sobre o super.
}
