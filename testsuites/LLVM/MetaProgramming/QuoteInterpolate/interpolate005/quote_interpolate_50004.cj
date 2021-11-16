// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

open class I{
    var a = 'a'
}

class A <: I{
    func test(){
    super.a
        var x = quote($(super.a))
        x.dump()
    }
}
/*
append Char with ToTokens {
    func toTokens(self:Char) {
        return quote(1)
    }
}
*/

func main(){
    A().test()
    return 0
}
