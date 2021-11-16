// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ptr: pass
// ASSERT: scan ptrtmp: pass

from ffi import c.*

foreign func testfunc(): CPointer<Float32>

unsafe func main():Int64 {
    var ptr: CPointer<Float32> = testfunc()
    var ptrtmp: CPointer<Float32> = ptr + 1

    if ( (ptr.read(0) == 3.14) && (ptr.read(1) == 0.0) && (ptr.read(2) == -3.14) ){
        print("ptr: pass\n")
    }

    if ( (ptrtmp.read(-1) == 3.14) && (ptrtmp.read() == 0.0) && ((ptrtmp+1).read() == -3.14) ){
        print("ptrtmp: pass\n")
    }

    return 0
}
