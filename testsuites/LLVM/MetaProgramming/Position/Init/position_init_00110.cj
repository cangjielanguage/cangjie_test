// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC-PIPE-1: %run %run_opt %output  %run_args 2>&1 | compare %f
// ASSERT: scan OverflowException

from ast import ast.*

func main(){
    var p = Position(0, MIN_INT32 - 1, MIN_INT32 - 1) // TODO: over flow check TBD.
    if (p.fileID != 0) {
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
