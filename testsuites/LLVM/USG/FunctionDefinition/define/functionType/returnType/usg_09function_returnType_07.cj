// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello!

// check the function as a return type
func helloFunc(): ()-> Unit{
    func hello(): Unit {print("Hello!\n")}
    return hello
}

func main(): Int64 {
    let f = helloFunc()
    f()
    return 0
}