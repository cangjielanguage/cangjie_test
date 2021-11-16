// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output

from ast import ast.*

func main(){
    var p = Position(Int32(0), Int32(0), Int32(0)) // EXPECTED: regex no matching constructor for call
    return 0
}
