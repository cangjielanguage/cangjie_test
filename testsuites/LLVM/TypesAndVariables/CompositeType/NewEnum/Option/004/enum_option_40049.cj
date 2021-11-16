// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {
    var item: Int64 = 100
}

class B{
    var c: C = C()
}

func main(): Int64 {
    let c1 : ?B = B()
    c1?.c?.item = 10
    let r1 = c1?.c?.item
    let res = r1 ?? 0
    return res - 10
}
