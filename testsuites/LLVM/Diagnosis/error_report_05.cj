// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64{
    var a: ()->Int64 = {=> x}    // EXPECTED: regex undeclared identifier 'x'
    var b = a() + 1
    b++
    return 0
}