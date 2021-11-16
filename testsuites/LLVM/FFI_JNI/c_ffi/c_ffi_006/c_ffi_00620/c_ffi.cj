// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello\nPASS\n

from ffi import c.*

foreign func testfunc(a: CString, b: CString, c: CString, d: CString, e: CString): Int32
foreign func fflushOut(): Unit

func main():Int64 {
    var a: CString = CString("H")
    var b: CString = CString("e")
    var c: CString = CString("l")
    var d: CString = CString("l")
    var e: CString = CString("o\n")
    unsafe { if (testfunc(a, b, c, d, e) == 6) {
          fflushOut()
          print("PASS\n")
      } else {
          print("ERROR\n")
      }
    }
    return 0
}
