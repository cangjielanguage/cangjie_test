// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*


class A{
    var a = 'a'
    func test(){
        var x = quote($this.a) // EXPECTED: regex dollar identifier must be identifier, not keyword
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
