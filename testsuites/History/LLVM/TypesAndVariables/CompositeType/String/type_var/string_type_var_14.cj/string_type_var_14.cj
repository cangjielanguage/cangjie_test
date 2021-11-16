// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait StringTrait {
    func int(a: This): This
}

append String with StringTrait {
    func int(a: String): String {
        return "convert to int:" + a
    }
}

func run(): Int64 {
    var str = "2"
    var res: String = int(str)
    if (res == "convert to int:2") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
