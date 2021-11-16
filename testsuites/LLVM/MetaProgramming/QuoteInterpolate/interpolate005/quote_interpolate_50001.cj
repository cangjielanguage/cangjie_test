// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

class A{
    func test(){
        var x = quote($this) // EXPECTED: regex dollar identifier must be identifier, not keyword
        x.dump()
    }
}

append A with ToTokens {
    func toTokens(self:A) {
        return quote(1)
    }
}

func main(){
    A().test()
    return 0
}
