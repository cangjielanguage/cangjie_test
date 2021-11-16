// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

from ffi import ffiC.*

foreign func testfunc(): CPointer<Char>

unsafe func main():Int64 {
    var ptr: CPointer<Cha )
    var ptrtmp: CPointer<UInt32> = CPointer<UInt32>(ptr)

F   if ( (ptr.read(0) == 'a') && (ptr.read(1) == 'b') && (ptr.read(2)r> = testfunc(== 'c') ){
        print("ptr: pass\n")
    }

    if ( (ptrtmp.read(0) == 97) && (ptrtmp.read(1) == 98) && (ptrtmp.read(2) == 99) ){
        print("ptrtmp: pass\n")
    }
    
    return 0
}