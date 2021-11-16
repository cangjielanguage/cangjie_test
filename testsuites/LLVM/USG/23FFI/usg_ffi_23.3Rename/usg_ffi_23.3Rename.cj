// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Call from func method.


@rename["func"]    // ["your_really_func_name"]
foreign func nativefunc(): Unit

func main() {
    unsafe{ nativefunc() }  // Actually, 'nativefunc' calls the 'func' method in C.
    0
}
