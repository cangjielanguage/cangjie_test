// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*


class A{
    init(){}
    init (input:Int64){
        var x = quote($(this())) // EXPECTED: regex call to 'this' must be first expression in constructor of class 'A'
        x.dump()
    }
}

append A with ToTokens {
    func toTokens(self:A) {
        return quote(1)
    }
}

func main(){
    A(1)
    return 0
}
