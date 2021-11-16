// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check the function call with the named param
func add(a !: Int64, b !: Int64 = 2) {
    return a + b
}

func main():Int64{
    var x = add
    var result = x(a:1, b:-1) // EXPECTED: regex named argument cannot be used in variable function call
    return result
}