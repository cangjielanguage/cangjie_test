// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// if-esle表达式，分支类型不一致，编译报错
func main(): Int64 {
    let list11 = [1, 2, 3, *(if (1<2) {[4, 5]} else {6})]  // EXPECTED:regex Types Class-List<Int64> and Int64 of the two branches of this 'if' expression mismatch.
    return 0
}
