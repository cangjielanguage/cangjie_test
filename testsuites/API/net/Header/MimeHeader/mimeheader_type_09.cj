// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    mime1.add("easy你-read","你好1")
    mime1.add("EASY\n-READ","789ab")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("easy你-read")
    var str2 = HeaderDfaUtil.CanonicalHeaderKey("EASY\n-READ")

    if( str1 != "easy你-read"){
        return 1
    }
    if( str2 != "EASY\n-READ"){
        return 2
    }
    if(case01(mime1.get("easy你-read")) != "你好1"){
        return 3
    }
    if(case01(mime1.get("EASY\n-READ")) != "789ab"){
        return 4
    }
    return 0
}
func case01(a:Option<String>){
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}