// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
func main(): Int64 {
    var a = HttpStatusCode.STATUS_TEMPORARY_REDIRECT
    if( a != 307){
        return 1
    }
    return 0
}