// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {
    var item: Int64 = 100
}

func main(): Int64 {
    let c1 : ?C = C()
    let x = Some(10)
    c1?.item = 10
    let r1 = c1?.item
    let res = r1 ?? 0
    return res - 10
}
