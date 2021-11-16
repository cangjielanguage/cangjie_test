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
    var res = (2,3)[0]+2 > (2,3)[1]-1
    if (res) {
        return 0
    }
    return 1
}
