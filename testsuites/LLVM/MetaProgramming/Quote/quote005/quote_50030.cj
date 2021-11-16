// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    var a = @{quote(1)}[quote(0)] // EXPECTED: regex-auto invalid subscript operator [] on type 'Array<Class-Tokens>' and 'Class-Tokens'
    return 0
}
