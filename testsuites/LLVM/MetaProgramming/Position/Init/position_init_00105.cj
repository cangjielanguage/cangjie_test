// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
from ast import ast.*

func main(){
    var p = Position(10000, 10000, 10000)
    if (p.fileID != 10000) {
        return 1
    }
    if (p.line != 10000) {
        return 2
    }
    if (p.column != 10000) {
        return 3
    }
    return 0
}