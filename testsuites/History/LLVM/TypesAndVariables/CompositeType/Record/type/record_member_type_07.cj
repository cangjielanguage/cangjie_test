// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    //let a: List<Int64> = [1, 2, 3]
    var a: ListFloat64 = ListFloat64(3,10.0)
}

let res: Test = Test()
var listA: ListFloat64 = res.a

func run(): Int64 {
    var res1  = listA.count()
    if (res1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
