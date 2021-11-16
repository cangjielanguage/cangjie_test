// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func foo<T>(a:T, b: Int8=-129): Int8 {    // EXPECTED: regex the number '-129' exceeds the value range of type 'Int8'
    return 256      // EXPECTED: regex the number '256' exceeds the value range of type 'Int8'
}

func main(): Int64 {
    foo<Int64>(3)
    return 0
}