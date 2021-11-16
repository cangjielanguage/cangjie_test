// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass
// ASSERT: scan Hello World
// ASSERT: scan-not Exception

foreign func testfunc(): Unit

func main():Int64 {
  unsafe { 
    if ( testfunc() == () ){
      print("pass\n")
    }
  }
  return 0
}
