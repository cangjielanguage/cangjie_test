// DEPENDENCE: InteropTest.cj InteropTest.java CJTest.java java_ffi_main.cj
// EXEC:%javac InteropTest.java
// EXEC:%javac CJTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda CJTest.class CJTest.panda
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt java_ffi_main.cj
// EXEC:%run %run_opt %panda_args CJTest.panda CJTest::main 2>&1 | compare %f
// ASSERT: scan in CJClass\nin InteropTest: null\n
// ASSERT: scan-not Exception
