// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

abstract class Base {
    static var test : Array<Bool> = @{true}
}

class Data <: Base {
    
}

func main(): Int64 {
		if( Data.test[0]){
		    return 0
		}
    return 1
}