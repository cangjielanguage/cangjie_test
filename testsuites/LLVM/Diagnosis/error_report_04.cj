// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64{
    var a: Int64 = x    // EXPECTED: regex undeclared identifier 'x'
    a++
    a = a +1
    return 0
}