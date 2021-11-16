// DEPENDENCE:../utils.cj
// ERRCHECK: %compiler %cmp_opt %f utils.cj %use_ast -o %output

from ast import ast.*

func main(){
    var a : Tokens = CangjieLex("<<&")
    var b : Tokens = quote(<<&) // EXPECTED: regex-auto illegal symbol '<<&'
    return check(a,b)
}

