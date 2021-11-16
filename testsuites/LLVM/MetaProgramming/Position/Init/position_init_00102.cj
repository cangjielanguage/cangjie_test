// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*

func main(){
    var p = Position(UInt32(0), Int32(0), Int32(0))
    if (p.fileID != 0) {
        return 1
    }
    if (p.line != 0) {
        return 2
    }
    if (p.column != 0) {
        return 3
    }
    return 0
}