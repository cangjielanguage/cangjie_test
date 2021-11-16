// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan this is from C.


@CallingConv[C]   /* C的调用约定 */
foreign func CallByCangjie() : Unit

func main() : Int64 {
    unsafe{ CallByCangjie() }
    0
}
