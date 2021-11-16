// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World\nPASS\nPASS\n

from ffi import c.*

foreign func testfunc(fmt: CString): Int32
foreign func fflushOut(): Unit

func main():Int64 {
    var str: CString = CString("Hello World\n")
    unsafe { if (testfunc(str) == 12) {
          fflushOut()
          print("PASS\n")
      } else {
          print("ERROR\n")
      }
    }
    str.free()
    if (str.isEmpty()) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
