// DEPENDENCE: %n.cpp cfg.json
// EXEC: %clang %clang_opt %n.cpp -o lib%n.so
// EXEC:sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %compiler %cmp_opt %f -i cfg.json -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan xxxx

from ffi import c.*

foreign func testfunc(fmt: String): Int32

func main():Int64 {
    if (testfunc("Hello World\n") == 12) {
        print("PASS\n")
    } else {
        print("ERROR\n")
    }
    return 0
}
