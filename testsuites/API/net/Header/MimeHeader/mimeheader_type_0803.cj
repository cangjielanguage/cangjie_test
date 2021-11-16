// EXEC: %compiler %cmp_opt -backend-options="-L $CANGJIE_HOME/lib -lcangjie-net" %f -o %output
// EXEC: %run %run_opt %output %run_args

from std import net.*
var mime1 = MimeHeader ()
func main(): Int64 {
    mime1.add("`easy-read","你好1")
    mime1.add("1EASY|-READ","789ab|")
    mime1.add("eASY-~READ","789ab~")
    var str1 = HeaderDfaUtil.CanonicalHeaderKey("`easy-read")
    var str2 = HeaderDfaUtil.CanonicalHeaderKey("1EASY|-READ")
    var str3 = HeaderDfaUtil.CanonicalHeaderKey("eASY-~READ")
    if( str1 != "`easy-Read"){
        return 1
    }
    if( str2 != "1easy|-Read"){
        return 2
    }
    if( str3 != "Easy-~read"){
        return 3
    }
    if(case01(mime1.get("`easy-Read")) != "你好1"){
        return 5
    }
    if(case01(mime1.get("1easy|-Read")) != "789ab|"){
        return 6
    }
    if(case01(mime1.get("Easy-~read")) != "789ab~"){
        return 7
    }
    return 0
}
func case01(a:Option<String>){
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}