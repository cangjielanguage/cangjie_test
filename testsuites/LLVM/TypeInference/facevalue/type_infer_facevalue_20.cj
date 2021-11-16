// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let i: Int8 = 10
func foo1(): Int8 {
    1+1+i
}
func foo2(): Int64 {
    5/2 + 10
}
func foo3(): Float32 {
    var i: Float32 = 10.0
    3.0%2.0 + i
}
func foo4(): Float64 {
    3.0/2.0 + 10.0
}

func main(): Int64 {
    var res1: Int8 = foo1()
    var res2: Int64 = foo2()
    var res3: Float32 = foo3()
    var res4: Float64 = foo4()

    if (res1 != 12 || res2 != 12 || res3 != 11.0 || res4 != 11.5) {
        return 1
    }
    return 0
}
