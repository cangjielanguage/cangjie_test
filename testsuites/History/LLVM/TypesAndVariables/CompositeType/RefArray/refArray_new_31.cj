// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

var a = RefArray<Int64>(Map<Int64,String>>()) // EXPECTED: regex no matching constructor for call 'RefArray'

func main(): Int64 {
    let b = RefArray<Int64>(Map<Int64,String>>()) // EXPECTED: regex no matching constructor for call 'RefArray'
    return 0
}
