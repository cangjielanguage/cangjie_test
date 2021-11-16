// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var MyChild = Child()
    if ( MyChild.a != "123" ) {
        return 1
    }
    return 0
}

open class Father {
    private var a  = 1
}

class Child <: Father {
    var a  = "123"
}