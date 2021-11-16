// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait CharTrait {
    func int(a: This): String
}

append Char with CharTrait {
    func int(a: Char): String {
        return "convert to int:" + a.toString()
    }
}

func run(): Int64 {
    var c = '2'
    var res = int(c)
    if (res == "convert to int:2") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
