// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
func main(): Int64 {
    var a = HttpStatusCode.STATUS_PRECONDITION_FAILED
    if( a != 412){
        return 1
    }
    return 0
}