// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// if-esle表达式，仅有单分支，编译报错
func main(): Int64 {
    let list11 = [1, 2, 3, *(if (1<2) {[4, 5]})]  // EXPECTED: regex the type of list spread must be List<T>
    return 0
}
