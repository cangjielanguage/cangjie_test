// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Call from func method.


@rename["func"]    /* "下方是你准备好的函数名" */
foreign func nativefunc(): Unit

func main() {
    unsafe{ nativefunc() }  /* 实际上，'nativefunc'调用C中的'func'方法 */
    0
}
