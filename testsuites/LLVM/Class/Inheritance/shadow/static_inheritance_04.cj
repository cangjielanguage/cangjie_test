// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

abstract class Base {
    static let test : Array<Bool> = @{}
}

class Data <: Base {
    
}

func main(): Int64 {
		Data.test = @{true}  // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
		if( Data.test[0]){
		    return 0
		}
    return 1
}