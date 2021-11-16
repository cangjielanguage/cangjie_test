// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not xxx

class C {
    var item: Unit = x()
}

func x(){print("xxx")}

func main(): Int64 {
    let c1 : ?C = None
    c1?.item = x()
    return 0
}
