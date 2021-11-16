// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    static var test : Int32 = 1
}

class Data <: Base {
    
}

func main(): Int64 {
    return Int64( Data.test - 1 )
}