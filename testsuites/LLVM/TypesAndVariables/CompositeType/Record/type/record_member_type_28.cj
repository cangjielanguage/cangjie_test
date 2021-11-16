// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
   let a: Range<Int32>
   let range1: Range<Int32> = 0..5:1
   init(x: Range<Int32>) {
        a = x
    }
}
let param: Range<Int32> = 0..10:1
let range1 = Test(param).range1

func run(): Int64 {
    var res: Int32 = 0
    for (i in range1) {
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
