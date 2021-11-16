// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var b = 1
    let a = @{@{1,0,1},@{1,1,1}}
    b = a[0][1][2]  // EXPECTED: regex invalid subscript operator \[\] on type 'Int64' and 'Int'
    return b
}
