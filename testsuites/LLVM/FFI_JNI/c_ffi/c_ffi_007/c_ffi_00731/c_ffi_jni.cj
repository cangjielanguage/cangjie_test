// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ptr: pass
// ASSERT: scan ptrtmp: pass

from ffi import c.*

foreign func testfunc(): CPointer<UInt32>

unsafe func main():Int64 {
    var ptr: CPointer<UInt32> = testfunc()
    var ptrtmp: CPointer<Int32> = CPointer<Int32>(ptr)

    if ( (ptr.read(0) == 97) && (ptr.read(1) == 98) && (ptr.read(2) == 99) ){
        print("ptr: pass\n")
    }

    if ( (ptrtmp.read(0) == 97) && (ptrtmp.read(1) == 98) && (ptrtmp.read(2) == 99) ){
        print("ptrtmp: pass\n")
    }
 
    return 0
}
