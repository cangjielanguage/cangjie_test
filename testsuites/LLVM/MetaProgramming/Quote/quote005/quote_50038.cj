// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// EXEC: %run %run_opt %output  %run_args

from ast import ast.*
from std import sync.*

func main(){
    var a = Mutex()
    synchronized(a){quote(1)}
    return 0
}
