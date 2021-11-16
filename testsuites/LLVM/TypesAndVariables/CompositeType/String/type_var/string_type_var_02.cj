// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello Char Lang

func foo(): String {
    var str =  "Hello Char Lang"
    return str
}

func run(): Int64 {
    var res = foo()
    print("StringTest: " + res)
    return 0
}

func main(): Int64 {
    return run()
}