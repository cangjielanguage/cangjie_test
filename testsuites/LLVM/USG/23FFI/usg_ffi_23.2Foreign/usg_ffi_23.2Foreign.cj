// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan this is from C.
// ASSERT: scan this is from C1.
// ASSERT: scan this is from C2.


foreign func CallByCangjie() : Unit  // foreign modifier

foreign {	// foreign block
    func CallByCangjie1() : Unit
    func CallByCangjie2() : Unit
}

func main() : Int64 {
    unsafe{ CallByCangjie() }
    unsafe{ CallByCangjie1() }
    unsafe{ CallByCangjie2() }
    0
}

