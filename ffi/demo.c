#include <stdio.h>

void print_demo() {
  printf("Dart FFI Demo!");
}

int sum(int a, int b) {
  return a + b;
}

int main() {
  print_demo();
  return 0;
}

// compile to .o: gcc -m64 -c demo.c
  // -m64 flag for targeting x64 systems 
// compile to .dll: gcc -shared -o demo.dll demo.o