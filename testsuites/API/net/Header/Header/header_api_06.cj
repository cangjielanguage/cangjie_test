// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var header1 = Header ()
func main(): Int64 {
   header1.add("&ab-abc","2")
   header1.add("&ab-abc","3")
   header1.add("&ab-abc","4")
   header1.add("&ab-abc","5")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("&ab-abc")
    if( str1 != "&ab-Abc"){
        return 1
    }
    var buffer1 = header1.getAll("&ab-Abc")
    if( buffer1.size() != 4){
        return 2
    }
    if( buffer1[0] != "2"){
        return 3
    }
    if( buffer1[1] != "3"){
        return 4
    }
    if( buffer1[2] != "4"){
        return 5
    }
    if( buffer1[3] != "5"){
        return 6
    }
    return 0
}
