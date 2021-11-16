// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

interface Data3 <: Data2{
}

open class Test <: Data2 & Data3{
    
}

class Test2 <: Test & Data2 & Data3{
    
}

func main(): Int64 {
		var res1 : Int64 = Test().foo(2)
    var res2 : Int64 = Test2().foo(2)
    if ( res1 != 2 || res2 != 2 ) {
        return 1
    }
    return 0
}
