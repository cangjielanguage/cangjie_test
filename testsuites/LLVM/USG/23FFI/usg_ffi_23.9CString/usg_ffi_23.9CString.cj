// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Get from Cangjie string success.

from ffi import c.*

foreign func PassStringToCangjie() : CString
foreign func GetStringFromCangjie(a : CString) : Unit

func main() {
    var a = unsafe{ PassStringToCangjie() }
    var b : CString = CString("hello world")
    if (!a.equals(b)) {
        return 1
    }
    unsafe{ GetStringFromCangjie(a) }
    b.free()
    0
}
