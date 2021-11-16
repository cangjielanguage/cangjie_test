// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

from ffi import c.*

@rename["ptrfunc"]
foreign func newptrfunc(p: CPointer<Int16>): CPointer<Int16>

@rename["getptr"]
foreign func newgetptr(): CPointer<Int16>

unsafe func main():Int64 {
    var ptr: CPointer<Int16> = newgetptr()
    var newptr: CPointer<Int16> = newptrfunc(ptr)

    if ( (newptr.read(0) == -32768) && (newptr.read(1) == 0) && (newptr.read(2) == 32767) ){
        print("ptr: pass\n")
    }

    return 0
}
