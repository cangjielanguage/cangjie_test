// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

foreign func testfunc(): CPointer<UInt32>

unsafe func main():Int64 {
    var ptr: CPointer<UInt32> = testfunc() 
    var ptrtmp: CPointer<UInt64> = CPointer<UInt32>(ptr) // EXPECTED: regex return type for 'init' is mismatched

    return 0
}
