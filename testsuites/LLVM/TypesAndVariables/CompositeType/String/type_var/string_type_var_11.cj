// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hello Char Lang

record Foo {
    var str: String = ""
    init(str1: String) {
        str = str1
    }
}

func run(): Int64 {
    var foo = Foo("Hello Char Lang")
    var res: String = foo.str
    print("StringTest: " + res)
    return 0
}

func main(): Int64 {
    return run()
}