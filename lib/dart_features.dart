final fib20 = fib(20); // Lazily initialized top level static variables

int fib(int n) {
  if (n == 0) return 0;
  if (n == 1) return 1;
  return fib(n - 1) + fib(n - 2);
}

int fib2(int n) {
  var last = 0; // local inferred types
  var result = 0;
  for (final i in List.generate(n - 2, (i) => i)) {
    result = last + result + i;
    last = i;
  }
  return result;
}
