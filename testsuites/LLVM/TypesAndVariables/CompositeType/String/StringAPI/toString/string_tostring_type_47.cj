// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex toStringTest:3

record Foo {
    var a: Int32 = 3
}

var a: Int32 = Foo().a

func run(): Int64 {
    print("toStringTest:" + a.toString())
    return 0
}

func main(): Int64 {
    return run()
}
