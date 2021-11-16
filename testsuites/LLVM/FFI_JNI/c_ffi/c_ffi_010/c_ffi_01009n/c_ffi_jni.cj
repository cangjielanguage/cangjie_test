// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output

from ffi import c.*

func testfunc():Int8 {
    print("test\n")
    return 0
}

@rename["testfunc"]
func newtestfunc(): Int8 {
    0
}

unsafe func main():Int64 {
    newtestfunc()
    
    return 0
}
