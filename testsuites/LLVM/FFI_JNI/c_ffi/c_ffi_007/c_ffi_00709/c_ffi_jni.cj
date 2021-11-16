// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ptr: pass
// ASSERT: scan ptrtmp: pass

from ffi import c.*

foreign func testfunc(): CPointer<UInt16>

unsafe func main():Int64 {
    var ptr: CPointer<UInt16> = testfunc() 
    var ptrtmp: CPointer<UInt16> = ptr + 1

    if ( (ptr.read(0) == 0) && (ptr.read(1) == 2) && (ptr.read(2) == 65535) ){
        print("ptr: pass\n")
    }

    if ( (ptrtmp.read(-1) == 0) && (ptrtmp.read() == 2) && ((ptrtmp+1).read() == 65535) ){
        print("ptrtmp: pass\n")
    }

    return 0
}
