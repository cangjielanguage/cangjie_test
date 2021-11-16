// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

import ast.*

var id : UInt16 = 156

func main(){
    var T : Tokens = Tokens(@{Token(156)})
    T.Seeing(Int64(156)) // EXPECTED: regex 'Seeing' is not a member of class 'Tokens'
    return 1
}
