// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped


var a = Array<Int32>(1, {i => true}) // EXPECTED: regex return type mismatch

func main(): Int64 {
    let b = Array<Int32>(1, {i => 1111111111111111})   // EXPECTED: regex  the number '1111111111111111' exceeds the value range of type 'Int32'

    return 0
}
