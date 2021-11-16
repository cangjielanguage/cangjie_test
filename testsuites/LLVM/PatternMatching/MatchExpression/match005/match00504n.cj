// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func test(): Int64 {
    match (18446744073709551616) {case _=> 2} // EXPECTED: regex the number '18446744073709551616' exceeds the value range of type 'Int'
}

func main(): Int64 {
    return test()
}

