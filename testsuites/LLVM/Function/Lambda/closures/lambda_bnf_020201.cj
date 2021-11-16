// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a = Coo()
    if ( a.b3 != 1 ){
        return 1
    }
    return 0
}

open class Boo{}

class Coo <: Boo {
    static var b0:Int64 = 1
    var b3 = { b0  }()
}