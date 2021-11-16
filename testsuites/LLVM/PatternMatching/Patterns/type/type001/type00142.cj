// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A{a(Int32)}

func test(): Int64 {
    var i : A = A.a(1)
    var res = match (i) {
        case a : A => 0
        case _ => 1
    }
    if (res != 0) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
