// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    var a = quote(1)..quote(10):quote(1) // EXPECTED: regex integer type is expected for start, stop and step in range expression
    return 0
}
