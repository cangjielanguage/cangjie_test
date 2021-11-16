// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo<T>(x:T):T{
    return x
}

class Data<T>{
    var i: T
    init (x: T){
        i = x
    }
}

func main(): Int64 {
    var res = (foo<Int32>, 1)[0](Data<Int32>(4).i)
    if (res == 4) {
        return 0
    }
    return 1
}
