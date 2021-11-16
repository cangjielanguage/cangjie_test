// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo<T>(a:T):T{
    return a
}

func main(): Int64 {
    var res1 = foo<Int64>(3+4/5*2-1)
    var res2 = foo<Float64>(3.1+4.0/-5.3*2.4-1.9)
//    print(res1.toString())
    if (res1 != 2) {
        return 1
    }
    if (res2 != -0.611320754716981) {
        return 1
    }
    return 0
}
