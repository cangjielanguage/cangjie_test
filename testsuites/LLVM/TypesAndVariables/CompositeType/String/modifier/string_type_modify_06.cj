// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello Char Lang

open class A {
    protected var str: String = "Hello Char Lang"
}
class SubB <: A {
    var newStr : String
    init() {
        newStr = str
    }
}

func run(): Int64 {
    print("StringTest: " + SubB().newStr)
    return 0
}

func main(): Int64 {
    return run()
}