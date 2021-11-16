// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

package define

from ast import ast.*

external macro test():Tokens{ // EXPECTED: regex expect right input parameter list
    quote(1)
}

func main(){
    return 0
}
