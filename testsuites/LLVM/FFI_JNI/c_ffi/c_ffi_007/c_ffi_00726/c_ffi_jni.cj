// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan before: pass
// ASSERT: scan after: pass

from ffi import c.*

foreign func testfunc(): CPointer<Char>

unsafe func main():Int64 {
    var ptr: CPointer<Char> = testfunc()
    var ptrtmp: CPointer<Char> = ptr

    if ( (ptr.read(0) == 'a') && (ptr.read(1) == 'b') && (ptr.read(2) == 'c') ){
        print("before: pass\n")
    }

    ptrtmp.write('d')

    if ( (ptrtmp.read(0) == 'd') && (ptrtmp.read(1) == 'b') && (ptrtmp.read(2) == 'c') ){
        print("after: pass\n")
    }

    return 0
}
