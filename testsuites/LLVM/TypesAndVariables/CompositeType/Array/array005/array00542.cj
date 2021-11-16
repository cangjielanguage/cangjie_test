// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
func main(): Int64 {
    var a = @{1,0}
    a[0] = 0.5 // EXPECTED: regex type incompatible in this assignment
    return a[0]
}
