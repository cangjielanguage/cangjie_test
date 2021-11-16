// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-auto the number '340000000000000000000000000000000000001e308' exceeds the value range

func main(): Int64 {
    let a: Float32 = 32767.8
    let b = a - 340000000000000000000000000000000000001e308

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
