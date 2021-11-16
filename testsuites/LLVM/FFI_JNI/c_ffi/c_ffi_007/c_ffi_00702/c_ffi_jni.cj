// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ptr: pass
// ASSERT: scan ptrtmp: pass


from ffi import c.*

foreign func testfunc(): CPointer<Bool>

unsafe func main():Int64 {
    var ptr: CPointer<Bool> = testfunc()
    var ptrtmp: CPointer<Bool> = ptr + 1

    if ( (ptr.read(0) == true) && (ptr.read(1) == false) && (ptr.read(2) == true) ){
        print("ptr: pass\n")
    }

    if ( (ptrtmp.read(-1) == true) && (ptrtmp.read() == false) && ((ptrtmp+1).read() == true) ){
        print("ptrtmp: pass\n")
    }
    
    return 0
}
