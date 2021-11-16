// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = Int32(1)..Int32(10):1
    let b = Int32(1)..10:1
    let c = 1..Int32(10):1
    let d = 1..10:1
    var e : Int32 = 1
    let e1 = e..e:1
    let e2 = e..1:1
    let e3 = 1..e:1
    let e4 = 1..1:1
    return 0
}
