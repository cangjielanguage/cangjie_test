// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{
    a(List<Int64>) |
    b(List<T>)
}

func test<T>(input: T){
    var b = E<T>.b([input])
    var res = match (b) {
        case b(x) => x.size() - 1
        case _ => 1
    }
    return res
}


func main(): Int64 {
    return test(1)
}
