// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    func f(x: Range<Int32>): Range<Int32> { return x}
}
var tmp:Range<Int32> = 0..10:1
let range1 = Test().f(tmp)

func run(): Int64 {
    var res: Int32 = 0
    for (i in range1) {
       res = res + 1
    }
    if (res == 10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}