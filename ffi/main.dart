import "dart:ffi" as FFI;

typedef print_demo_c = FFI.Void Function();
typedef PrintDemo = void Function();

typedef sum_c = FFI.Int32 Function(FFI.Int32 a, FFI.Int32 b);
typedef Sum = int Function(int a, int b);

void main(List<String> args) {
  final path = "demo.dll";
  final lib = FFI.DynamicLibrary.open(path);
  final PrintDemo demo =
      lib.lookup<FFI.NativeFunction<print_demo_c>>('print_demo').asFunction();

  demo();
  print(""); // newline

  final Sum sum = lib.lookup<FFI.NativeFunction<sum_c>>('sum').asFunction();
  print(sum(420, 69));
}
