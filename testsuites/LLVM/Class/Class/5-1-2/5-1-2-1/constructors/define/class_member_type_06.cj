// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: String = "Hello, Char Lang"
    var b: String
    init(x: String){
        b = x
    }
    func f(x: String): String{
        return x + " world"
    }
}

func run(): Int64 {
    var test: Test = Test("Hello Char Lang")
    var res1: String = test.a
    var res2: String = test.b
    var res3: String = test.f("Hello")
    if (res1 == "Hello, Char Lang" && res2 == "Hello Char Lang" && res3 == "Hello world") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
