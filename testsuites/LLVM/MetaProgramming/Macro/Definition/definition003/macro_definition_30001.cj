// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func test(){
    macro test(input:Tokens):Tokens{ // EXPECTED: regex 'macro' is not allowed in block, expected expression or declaration here
        input
    }
}

func main(){
    return 0
}
