// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan World
// ASSERT: scan-not Exception

from ffi import c.*

@c
func cstr(a: CString, b: CString): CString {
    if(a.equals(b)){
        return a
    } else{
        return b
    }
}

foreign func get_cstr(cb: CFunc<(CString, CString)->CString>): CString

foreign func printf(fmt: CString): Int32

unsafe func main():Int64 {
    var res: CString = get_cstr(cstr)
    printf(res)
    return 0
}
