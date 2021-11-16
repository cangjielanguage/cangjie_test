// DEPENDENCE: InteropTest.java java_ffi_main.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class %output
// EXEC: %compiler %cmp_opt java_ffi_main.cj
// EXEC:%run %run_opt %panda_args %output InteropTest::main 2>&1 | compare %f
// ASSERT: scan catch success\n
// ASSERT: scan java.lang.reflect.InvocationTargetException
// ASSERT: scan Caused by: java.lang.ArrayIndexOutOfBoundsException: idx = 2; length = 2