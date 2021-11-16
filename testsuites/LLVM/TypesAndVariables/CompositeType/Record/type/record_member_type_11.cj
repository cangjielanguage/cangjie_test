// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    //let range1: Range<Int32> = 0..10
    let range1 = Int64(0)..5
}

func run(): Int64 {
    var res: Int64 = 0
    var a = [0,1,2,3,4,5,6,7,8,9]
    let b = Test().range1
    for (i in a[b]) {
        res = res + i
    }
    if (res == 10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
