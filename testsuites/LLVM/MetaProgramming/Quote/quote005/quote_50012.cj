// ERRCHECK: %compiler %cmp_opt %use_ast %enable_macro %f -o %output

from ast import ast.*
from std import collection.*

func main(){
    var a : HashMap<Tokens, Tokens> // EXPECTED: regex generics type arguments do not match the constraint
    var b : HashSet<Tokens> // EXPECTED: regex generics type arguments do not match the constraint
    return 0
}
