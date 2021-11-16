// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

foreign func testfunc(): CPointer<UInt8>

unsafe func main():Int64 {
    var ptr: CPointer<UInt8> = testfunc() 
    var ptrtmp: CPointer<UInt8> = ptr + 1

    if ( (ptr.read(0) == 0) && (ptr.read(1) == 2) && (ptr.read(2) == 255) ){
        ptr.write(-255)  // EXPECTED: regex the number '-255' exceeds the value range of type 'UInt8'
    }

    return 0
}
