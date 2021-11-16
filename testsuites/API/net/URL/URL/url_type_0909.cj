// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "a////b@/a????1@=3b#@17"
    var i1 = "http1.://!$&-ab:12!$&@www.baidu.com:14////a/b@/a??1@=3b"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "a////b@/a????1@=3b#@17"){
        return 1
    }
    if( d1 != "http1.://!$&-ab:12!$&@www.baidu.com:14////a/b@/a??1@=3b"){
        return 2
    }
    if( s.rawQuery != "???1@=3b" ){
        return 3
    }
    if( s1.rawQuery != "?1@=3b" ){
        return 4
    }
    return 0
}