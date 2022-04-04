class MyClass {
  MyClass();
  int method(
    int requiredArgument, {
    required int optionalNamedArgument,
    int optionalWithDefault = 9,
  }) {
    return requiredArgument + optionalNamedArgument + optionalWithDefault;
  }

  int method2(
    int requiredArgument, [
    int? optionalPositionalArgument,
    int optionalWithDefault = 9,
  ]) {
    return requiredArgument +
        (optionalPositionalArgument ?? 0) +
        optionalWithDefault;
  }

  String getFromMap() {
    return {'a': 'b'}['c']!;
  }

  String? getFromMapSafe() {
    return {'a': 'b'}['c'];
  }

  String? getFromNullMap() {
    Map<String, String>? map;
    return map?['c'];
  }
}
