// ERRCHECK: %compiler %cmp_opt %use_ast %f -o %output
// ASSERT: scan the number '-1' exceeds the value range of type 'UInt32'
from ast import ast.*

func main(){
    var p = Position(-1, MaxInt32, MaxInt32)
    if (p.fileID != MaxUInt32) {
        return 1
    }
    if (p.line != MaxInt32) {
        return 2
    }
    if (p.column != MaxInt32) {
        return 3
    }
    return 0
}