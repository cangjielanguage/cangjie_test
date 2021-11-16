// DEPENDENCE: InteropTest.java java_ffi_main.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC: %compiler %cmp_opt java_ffi_main.cj
// EXEC:%run %run_opt %panda_args InteropTest.panda InteropTest::main 2>&1 | compare %f
// ASSERT: scan in CJClass\n
// ASSERT: scan-not Exception
