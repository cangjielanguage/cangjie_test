// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

class A{
    var a = 'a'
    func test(){
        var x = quote($(this.a))
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
