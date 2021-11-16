// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not Exception

foreign func testfunc1(a: Int64, b: Int64): Int64
foreign func testfunc2(a: Int64, b: Int64): Int64

func main():Int64 {
  unsafe { if (testfunc1(1, -1) == testfunc2(-1, 3)) {
      return 0
    }
  }
  return 1
}
