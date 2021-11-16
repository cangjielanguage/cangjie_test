// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan pass\n
// ASSERT: scan-not Exception

from ffi import c.*

@c
record teststructtmp {
    var i8: Int8
    var ui8: UInt8
}

@c
func cstruct(a: teststructtmp): teststructtmp {
    var b: teststructtmp = a
    b.i8 = 10
    return b
}

foreign func get_cstruct(cb: CFunc<(teststructtmp)->teststructtmp>): teststructtmp

unsafe func main():Int64 {

    var res: teststructtmp = get_cstruct(cstruct)

    if ( (res.i8 == 10) && (res.ui8 == 0) ) {
        print("pass\n")
    } else {
        print("fail\n")
    }
    
    return 0
}
