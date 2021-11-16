// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Int32 = 1

    init(input:Int32){
    a = input
    }
}
var a = Test(5).a

func run(): Int64 {
    if (a == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

