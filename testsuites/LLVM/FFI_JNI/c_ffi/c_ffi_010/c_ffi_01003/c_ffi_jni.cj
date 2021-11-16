// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

from ffi import c.*

@rename["cstrfunc"]
foreign func newcstrfunc(p: CPointer<Int8>): CPointer<Int8>

@rename["getcstr"]
foreign func newgetcstr(): CPointer<Int8>

foreign func printf(fmt: CString, ...): Int32

unsafe func main():Int64 {
    var cstr: CPointer<Int8> = newgetcstr()
    var newcstr: CPointer<Int8> = newcstrfunc(cstr)

    if ( (newcstr.read(0) == 104) && (newcstr.read(1) == 101) && (newcstr.read(2) == 108) && (newcstr.read(3) == 108) && (newcstr.read(4) == 111) && (newcstr.read(5) == 32) && (newcstr.read(6) == 119) && (newcstr.read(7) == 111) && (newcstr.read(8) == 114) && (newcstr.read(9) == 108) && (newcstr.read(10) == 100)){
        print("pass\n")
    }

    return 0
}

