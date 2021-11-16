// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args
from ast import ast.*

func main(){
    var p = Position(0, -1, -1)
    if (p.fileID != 0) {
        return 1
    }
    if (p.line != -1) {
        return 2
    }
    if (p.column != -1) {
        return 3
    }
    return 0
}