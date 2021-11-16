// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
    var a : ?T
    init(x:?T){a = x}
}

func main(): Int64 {
    var x = A<Bool>(true)
    return 0
}
