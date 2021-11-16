// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{
    a1(List<Int64>) |
    b1(List<T>)
}

func main(): Int64 {
    var a = a1<Int64>([1])
    var b = b1<Int64>([1])
    var res1 : Int64 = match (a) {
        case a1(x) => x.size()
        case _ => 0
    }
    var res2 : Int64 = match (b) {
        case b1(x) => x.size()
        case _ => 0
    }
    return res1 + res2 - 2
}
