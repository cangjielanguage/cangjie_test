// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// EXEC: %run %run_opt %output  %run_args

import ast.*

func main(){
    var T1 = Tokens()
    var it = T1.iterator()
    var res = match (it.next()) {
        case Some(obj) => obj
        case $None => Token()
    }
    var ret = match (res.kind) {
        case $END => "end"
        case _ => "mismatch"
    }
    if (ret != "end") {
        return 1
    }
    return 0
}
