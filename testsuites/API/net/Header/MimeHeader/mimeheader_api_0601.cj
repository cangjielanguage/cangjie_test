// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    mime1.add("!ab--abc","2")
    mime1.add("!ab--abc","2")
    mime1.add("!ab--abc","2")
    mime1.add("!ab--abc","2")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("!ab--abc")
    if( str1 != "!ab--Abc"){
        return 1
    }
    var buffer1 =  mime1.getAll("!ab--Abc")
    if( buffer1.size() != 4){
        return 2
    }
    if( buffer1[0] != "2"){
        return 3
    }
    if( buffer1[1] != "2"){
        return 4
    }
    if( buffer1[2] != "2"){
        return 5
    }
    if( buffer1[3] != "2"){
        return 6
    }
    return 0
}
