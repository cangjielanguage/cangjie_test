// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define

from ast import ast.*

external macro test(input:Int64):Int64{ // EXPECTED: regex illegal macro param type, must be Tokens
    input
}

func main(){
    return 0
}
