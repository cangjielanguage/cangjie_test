// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait StringTrait {
    func test(a: Int32, b: This): String
}

append String with StringTrait {
    func test(a: Int32, b: String): String {
        return "result is " + a.toString() + "!"
    }
}

func run(): Int64 {
    var num: Int32 = 3
    var res: String = test(num, "")
    if (res == "result is 3!") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}