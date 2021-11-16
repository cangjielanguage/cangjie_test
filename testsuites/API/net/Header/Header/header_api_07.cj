// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args
//brief:func write(w: WriteStream): Unit,
//detail:Header

from std import net.*
from std import io.*
var header1 = Header ()
func main(): Int64 {
    header1.add("*ab--abc","2")
    var ss:StringStream =  StringStream("")
    header1.write(ss)
    var b = ss.toString()
    print(b)
    if( b != "*ab--Abc: 2\r\n"){
        return 1
    }
    return 0
}
