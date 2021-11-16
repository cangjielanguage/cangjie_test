// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ptr: pass

from ffi import c.*

foreign func testfunc(input: CPointer<Int8>): CPointer<Int8>

unsafe func main():Int64 {
    var input: CPointer<Int8> = CPointer<Int8>()
    var ptr: CPointer<Int8> = testfunc(input)

    if ( (ptr.read(0) == 127) && (ptr.read(1) == 0) && (ptr.read(2) == -128) ){
        print("ptr: pass\n")
    }

    return 0
}
