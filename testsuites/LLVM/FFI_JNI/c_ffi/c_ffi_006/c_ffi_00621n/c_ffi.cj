// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f
// ASSERT: scan error

from ffi import c.*

foreign func testfunc(fmt: String): Int32

func main():Int64 {
    unsafe { if (testfunc("Hello World\n") == 12) {
          print("PASS\n")
      } else {
          print("ERROR\n")
      }
    }
    return 0
}
