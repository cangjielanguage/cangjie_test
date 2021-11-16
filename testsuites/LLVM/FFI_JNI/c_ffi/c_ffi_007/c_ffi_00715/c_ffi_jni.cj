// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ptrtmp: pass

from ffi import c.*

foreign func testfunc1(): CPointer<Int8>
foreign func testfunc2(input: CPointer<Int8>): CPointer<Int8>

unsafe func main():Int64 {
    var ptr: CPointer<Int8> = testfunc1()
    var ptrtmp: CPointer<Int8> = testfunc2(ptr)  

    if ( (ptrtmp.read(0) == 127) && (ptrtmp.read(1) == 0) && ((ptrtmp).read(2) == -128) ){
        print("ptrtmp: pass\n")
    }

    //print(ptrtmp.read(0))
    //print(ptrtmp.read(1))
    //print(ptrtmp.read(2))

    return 0
}
