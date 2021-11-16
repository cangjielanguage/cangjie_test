// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func main(){
    var p = Position(MAX_UINT32, MIN_INT32, MIN_INT32)
    if (p.fileID != MAX_UINT32) {
        return 1
    }
    if (p.line != MIN_INT32) {
        return 2
    }
    if (p.column != MIN_INT32) {
        return 3
    }
    return 0
}
