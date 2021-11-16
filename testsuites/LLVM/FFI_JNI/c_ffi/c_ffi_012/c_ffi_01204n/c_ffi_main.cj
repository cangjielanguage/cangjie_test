// DEPENDENCE: pkg cfg.json cfg-main.json c_ffi.c
// EXEC: %clang %clang_opt c_ffi.c -o libc_ffi.so
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg-main.json
// EXEC: %compiler %cmp_opt %pkg_compile pkg/pkg.cj -o libpkg.so
// EXEC: %compiler %cmp_opt %f %pkg_link -o %output
// EXEC: LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH && %run %pkg_run %output %run_args 2>&1 | compare %f
// ASSERT: scan pass
// ASSERT: scan-not Exception

import pkg.*

unsafe func main():Int64 {
    var result: Int8 = newtestfunc(1,2)
    if (result == 3){
        print("pass\n")
    }
    return 0
}
