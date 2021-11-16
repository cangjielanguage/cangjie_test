// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC:sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello World by cangjie\n

from ffi import c.*

foreign func printf(fmt: CString): Int32
foreign func testfunc(): CString

unsafe func main():Int64 {
    let str: CString = testfunc()
    printf(str)
    return 0
}
