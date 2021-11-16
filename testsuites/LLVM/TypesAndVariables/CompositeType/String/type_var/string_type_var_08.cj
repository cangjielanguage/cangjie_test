// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello Char Lang

interface I {
    static func bar(str: String) { return str }
}

class Test <: I{}

func run(): Int64 {
    var str = "Hello Char Lang"
    var res: String = Test.bar(str)
    print("StringTest: " + res)
    return 0
}

func main(): Int64 {
    return run()
}