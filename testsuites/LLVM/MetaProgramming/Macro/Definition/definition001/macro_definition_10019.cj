// ERRCHECK: %compiler %cmp_opt %use_ast %f %enable_macro -o %output

package define

from ast import ast.*

external macro test(input:Tokens):Tokens{
    record R{ // EXPECTED: regex 'record' is not allowed in block, expected expression or declaration here
    var r = 1
    func test(){}
}
    Tokens()
}

func main(){
    return 0
}
