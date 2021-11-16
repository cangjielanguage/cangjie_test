// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

from ffi import c.*

@rename["ptrfunc"]
foreign func newptrfunc(p: CPointer<Int32>): CPointer<Int16>

@rename["getptr"]
foreign func newgetptr(): CPointer<Int32>

unsafe func main():Int64 {
    var ptr: CPointer<Int32> = newgetptr()
    var newptr: CPointer<Int32> = newptrfunc(ptr)  // EXPECTED: regex return type for 'newptrfunc' is mismatched

    if ( (newptr.read(0) == -32768) && (newptr.read(1) == 0) && (newptr.read(2) == 32767) ){
        print("ptr: pass\n")
    }

    return 0
}
