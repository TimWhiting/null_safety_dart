// @dart=2.11

class MyClass {
  MyClass();
  int method(
    int requiredArgument, {
    int optionalNamedArgument,
    int optionalWithDefault = 9,
  }) {
    return requiredArgument + optionalNamedArgument + optionalWithDefault;
  }

  int method2(
    int requiredArgument, [
    int optionalPositionalArgument,
    int optionalWithDefault = 9,
  ]) {
    return requiredArgument + optionalPositionalArgument + optionalWithDefault;
  }

  String getFromMap() {
    return {'a': 'b'}['c'];
  }

  String getFromNullMap() {
    Map<String, String> map;
    return map['c'];
  }
}
