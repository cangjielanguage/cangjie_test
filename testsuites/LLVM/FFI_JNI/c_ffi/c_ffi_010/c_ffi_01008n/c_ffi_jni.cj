// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

foreign func open(pathname: CString, oflags: Int32): Int32 // EXPECTED: regex 'open' is keyword not identifier, you can use '`open`' instead

unsafe func main():Int64 {

    return 0
}
