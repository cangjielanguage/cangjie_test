// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not Exception

foreign func testfunc(a: UInt16, b: UInt16): UInt16

func main():Int64 {
  unsafe { if (testfunc(32768, 32769) == 65535) {
      return 0
    }
  }
  return 1
}
