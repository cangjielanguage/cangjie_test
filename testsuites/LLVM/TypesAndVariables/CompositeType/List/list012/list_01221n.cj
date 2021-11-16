// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

// *在元组中解析
func main(): Int64 {
    let a = (*[1,3,4])  // EXPECTED: regex invalid expression initialization
    if (a[2] == 4) {
        return 0
    }
    return 1
}
