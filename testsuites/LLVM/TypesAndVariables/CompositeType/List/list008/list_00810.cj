// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{
    a(List<Int64>) |
    b(List<T>)
}

func main(): Int64 {
    var a = E<Int64>.a([1])
    var b = E<Int64>.b([1])
    var res1 = match (a) {
        case a(x) => x.size() - 1
        case _ => 1
    }
    var res2 = match (b) {
        case b(x) => x.size() - 1
        case _ => 1
    }
    return res2 + res1
}
