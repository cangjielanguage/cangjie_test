// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    print("${times2plus10(9)}\n")
    var a = times2plus10(9)
    if ( a != 28 ){
        return 1
    }
    return 0
}

func times2(a: Int64) : Int64 {
    return a * 2
}

func plus10(a: Int64) : Int64 {
    return a + 10
}

func times2plus10(a: Int64) {
    return composition<Int64, Int64, Int64>(times2, plus10)(a)
}