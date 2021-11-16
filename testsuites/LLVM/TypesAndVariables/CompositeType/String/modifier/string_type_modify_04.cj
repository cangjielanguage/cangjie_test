// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello Char Lang

class A {
    public var str: String = "Hello Char Lang"
}

class B {
    var str: String = A().str
}

func run(): Int64 {
    print("StringTest: " + B().str)
    return 0
}

func main(): Int64 {
    return run()
}