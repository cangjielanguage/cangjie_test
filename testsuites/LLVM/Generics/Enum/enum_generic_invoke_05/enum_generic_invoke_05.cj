// DEPENDENCE: enum_generic_invoke_05_a.cj
// EXEC: %compiler %cmp_opt %n.cj enum_generic_invoke_05_a.cj -o %output
// EXEC: %run %run_opt %output %run_args

package enum_generic_invoke_05

func run(): Int64 {
    var time = TimeUnit<Int32>.Year(4)
    var month = Month<Int32>(3)
    var res1: Int32 = match (time) {
        case Year(x) => 2020
        case Month(x) => 9
    }
    var res2: Int32 = match (month) {
        case Year(x) => 2020
        case Month(x) => 9
    }
    if (res1 == 2020 && res2 == 9) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
