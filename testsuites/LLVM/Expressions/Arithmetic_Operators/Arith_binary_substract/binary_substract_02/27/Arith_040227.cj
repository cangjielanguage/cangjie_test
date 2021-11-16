// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex invalid binary operator '-' on type 'Int16' and 'Float'


func main(): Int64 {
    let a: Int16 =  2020 - 0.1

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
