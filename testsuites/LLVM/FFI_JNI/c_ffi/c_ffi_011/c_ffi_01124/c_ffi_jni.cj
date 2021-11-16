// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 100
// ASSERT: scan pass
// ASSERT: scan-not Exception

from ffi import c.*

var cptr: CFunc<(CPointer<Int8>) -> CPointer<Int8>> = {a =>
    if (unsafe { a.read() == 48 } ) {
        print("pass\n")
    }
    var b: CPointer<Int8> = a
    unsafe { b.write(0,49) } // ascii: '1' => 49
    return b
}

foreign func get_cptr(cb: CFunc<(CPointer<Int8>)->CPointer<Int8>>): CPointer<Int8>

foreign func printf(fmt: CString): Int32

unsafe func main():Int64 {
    var res: CPointer<Int8> = get_cptr(cptr) 
    print(res.read().toString())
    return 0
}
