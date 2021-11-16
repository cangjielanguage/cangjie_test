// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World testfunc1\nHello World testfunc2\n

foreign {
  func testfunc1(): Unit
  func testfunc2(): Unit
}

func main():Int64 {
  unsafe { testfunc1() }
  unsafe { testfunc2() }
  return 0
}
