// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var MyChild = Child()
    if ( MyChild.a != 2 ) {
        return 1
    }
    return 0
}

open class GrandFather {
    static private var a  = 1
}

open class Father <: GrandFather {}

class Child <: Father {
    public var a  = 2
}