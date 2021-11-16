// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = 0..1:1 && 1..2:1  // EXPECTED: regex invalid binary operator '&&' on type 'Class-Range<Int64>' and 'Class-Range<Int64>'
    return 1
}
