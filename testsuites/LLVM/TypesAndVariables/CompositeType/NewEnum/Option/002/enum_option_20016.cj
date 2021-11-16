// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class B{}

enum A<T>{
    a(?T)
}

func main(): Int64 {
    var x = a<B>(B())
    return 0
}
