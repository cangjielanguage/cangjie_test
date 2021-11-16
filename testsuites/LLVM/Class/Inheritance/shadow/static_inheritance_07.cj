// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    static var test : Array<Bool> = @{true}
}

class Data <: Base {
    var data: Array<Bool> = test
}

func main(): Int64 {
    if( Data().data[0] && Data.test[0]){
        return 0
    }
    return 1
}