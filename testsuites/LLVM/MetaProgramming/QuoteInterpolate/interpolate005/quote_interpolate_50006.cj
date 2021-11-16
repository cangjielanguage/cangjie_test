// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

open class I{
}

class A <: I{
    init(){
        var x = quote($(super())) // EXPECTED: regex call to 'super' must be first expression in constructor of class 'A'
        x.dump()
    }
}

append I with ToTokens {
    func toTokens(self:I) {
        return quote(1)
    }
}

func main(){
    A()
    return 0
}
