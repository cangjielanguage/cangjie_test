// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define
from ast import ast.*

external macro test(input:Tokens):Tokens{
    record A{  // EXPECTED: regex 'record' is not allowed in block, expected expression or declaration here
        func test(a:Tokens=quote(1)){}
    }
    input
}

func main(){
    return 0
}
