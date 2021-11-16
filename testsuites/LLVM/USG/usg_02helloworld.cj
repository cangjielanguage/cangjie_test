// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello, world!
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

/*
仓颉的入口函数
*/
func main() {
    print("Hello, world!") // 尝试打印点东西
}
