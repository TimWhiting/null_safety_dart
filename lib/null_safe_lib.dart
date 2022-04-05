import 'dart:math' as math;
import 'dart:math';
import 'package:meta/meta.dart';
// Deferred imports?
// part files?

// exports
export 'dart:math';

class MyClass {
  MyClass._(this.myString); // No assert(myString != null) because it can't be
  final property = 10;
  final String myString;
  late final String property2 = ' $myString $property';
  int? _assignedLaterOnce; // private

  set assignedLaterOnce(int? value) {
    if (_assignedLaterOnce == null) {
      throw UnimplementedError(
          'assignedLaterOnce is not implemented for people who like null');
    }
    assignedLaterOnce = value;
    print('Haha you thought I was going to assign it correctly');
    assignedLaterOnce = -(value ?? 0);
  }

  static final singleton = MyClass._('singleton');

  MyClass.named(this.myString);
  factory MyClass.named2(String myString, {required String newString}) =
      MySubClass;

  factory MyClass.subclassMaybe(String myString, {required String newString}) {
    if (myString == 'maybe') {
      return MySubClass2(myString, newString: newString);
    }
    return MySubClass(myString, newString: newString);
  }

  int method(
    int requiredArgument, {
    required int optionalNamedArgument,
    int optionalWithDefault = 9,
  }) {
    [0].maxValue;
    return requiredArgument + optionalNamedArgument + optionalWithDefault;
  }

  int method2(
    int requiredArgument, [
    int? optionalPositionalArgument,
    int optionalWithDefault = 9,
  ]) {
    _assignedLaterOnce ??= [0, 1, 3].maxValue;
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

const minInt = -2147483648;

extension on List<int> {
  @useResult
  int get maxValue => fold(minInt, math.max);
}

extension on void Function(Object) {
  String Function(Object) wrap(String value) {
    return (v) {
      final wrappedValue = '$value $v $value';
      this(wrappedValue);
      return wrappedValue;
    };
  }
}

class MySubClass extends MyClass {
  MySubClass(super.myString, {required this.newString}) : super.named();
  final String newString;

  @override
  String get myString => print.wrap(newString)(super.myString);
}

class MySubClass2 extends MyClass {
  MySubClass2(super.myString, {required this.newString}) : super.named();
  final String newString;

  @override
  String get myString {
    final funcs = [print, null];
    return funcs[Random().nextInt(2)]?.wrap(newString)(super.myString) ??
        super.myString;
  }
}

int alwaysAssigned(bool condition) {
  final int newValue;
  if (condition) {
    newValue = 100;
  } else {
    newValue = 10;
  }
  return newValue;
}

enum EnumClass {
  one.named(0),
  two.named(-1),
  three.named(1),
  ;

  const EnumClass.named(this.val);
  final int val;
}

int toValTimesSomething(EnumClass? e) {
  if (e == null) {
    return -10000;
  }
  switch (e) {
    case EnumClass.one:
      return e.val * 1;
    case EnumClass.two:
      return e.val * 2;
    case EnumClass.three:
      return e.val * 3;
  }
}

int toVal(EnumClass? e) {
  return e?.val ?? -1000;
}

Iterable<int> firstN(int n, [int start = 0]) sync* {
  for (var i = start; i < n; i++) {
    yield i;
  }
}

Stream<int> firstNAsyncRecursive<T>(
  int n,
  Future<T> Function(int) func, [
  int start = 0,
]) async* {
  for (final i in firstN(n, start)) {
    await func(i);
    yield i;
    yield* firstNAsyncRecursive(n, func, min(i + 1, n));
  }
}

Future<void> delay(int ms) async {
  await Future.delayed(Duration(milliseconds: ms));
}

Future<void> streamSink() async {
  await for (final i in firstNAsyncRecursive(10, delay, 3)) {
    print(i);
  }
}

void main() {
  streamSink();
}
