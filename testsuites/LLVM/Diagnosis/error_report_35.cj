// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    var f : Float64 =  1.1p0   // EXPECTED: regex decimal number cannot have exponent part
    return 0
}

