// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
//    func f(x: List<Int64>): List<Int64> { return x}
    func f(x: ListFloat64): ListFloat64 { return x}
}

let res: Test = Test()
//var listA: List<Int64> = res.f([1, 2, 3])
var listA : ListFloat64 = res.f(ListFloat64(3,10.0))

func run(): Int64 {
    var res1 = listA.count()
    if (res1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
