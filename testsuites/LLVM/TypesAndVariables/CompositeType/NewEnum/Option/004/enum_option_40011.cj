// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum C {
    c
    func test(a:Int64){a}
}

func bar(x:Int64){1}

func main(): Int64 {
    var x = C.c
    let c1 = Option<C>.Some(x)
    let r1 = c1?.test
    var res = r1 ?? bar
    return res(0)
}
