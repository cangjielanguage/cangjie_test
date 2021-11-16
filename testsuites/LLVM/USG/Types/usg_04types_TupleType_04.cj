// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    operator func ==(left: A): Bool { return true }
}

func main(): Int64 {
    let t1 = (A(), 1)
    let t2 = (A(), 1)
    if (t1 == t2) {
        print("t1 == t2")
    }
    return 0
}
