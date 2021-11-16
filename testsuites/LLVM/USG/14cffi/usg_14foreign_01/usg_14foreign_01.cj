// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: regex random number \d+$
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// 首先用 foreign 声明这个函数
foreign func rand(): Int32

func main() {
    // 接下来就可以调用这个函数
    let r = unsafe { rand() }
    print("random number ${r}\n")
}
