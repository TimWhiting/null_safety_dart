import 'package:flutter_test/flutter_test.dart';
import 'package:null_safety_dart/dart_features.dart';

void main() {
  test('test', () {
    expect(fib(10), equals(fib2(10)));
  });
}
