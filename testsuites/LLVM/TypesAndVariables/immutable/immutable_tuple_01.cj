// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a1: (Aoo*Coo) = (Aoo(2),Coo(2))
    a1[0].a++
    if ( a1[0].a != 3 ){
        return 1
    }
    return 0
}

class Aoo {
    var a: Int32 = 1
    let b: Int32 = 1
    init (x: Int32 ){ a = x }
}

record Coo {
    var a: Int32 = 1
    let b: Int32 = 1
    init (x: Int32 ){ a = x }
}