// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check the function call with the defult value
func add(a !: Int32, b !: Int32 = 2) {
    return a + b
}

func main():Int64{
    var x = add
    var result = x(a:1) // EXPECTED: regex missing argument for call with parameter list
    return 0
}