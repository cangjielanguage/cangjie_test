// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    mime1.set("#ab--abc","2")
    var buffer1 =  mime1.getAll("#ab--Abc")
    if( buffer1.size() != 1){
        return 2
    }
    if( buffer1[0] != "2"){
        return 3
    }
    return 0
}
