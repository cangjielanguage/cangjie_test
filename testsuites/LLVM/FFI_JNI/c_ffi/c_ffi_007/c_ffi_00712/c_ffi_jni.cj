// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ptr: pass

from ffi import c.*

foreign func testfunc(): CPointer<CPointer<Int8>>

unsafe func main():Int64 {
    var ptr: CPointer<CPointer<Int8>> = testfunc()

    if ( (ptr.read().read(0) == -128) && (ptr.read().read(1) == 0) && (ptr.read().read(2) == 127) ){
        print("ptr: pass\n")
    }

    return 0
}
