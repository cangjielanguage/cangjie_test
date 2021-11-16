// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http1.:////!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@/=3b#@1/7"
    var i1 = "http1.:////!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@/=3b"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http1.:////!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@/=3b#@1/7"){
        return 1
    }
    if( d1 != "http1.:////!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@/=3b"){
        return 2
    }
    if( s.path != "//!$&-ab:12!$&@www.baidu.com:14/a/b@/a" ){
        return 5
    }
    if( s1.path != "//!$&-ab:12!$&@www.baidu.com:14/a/b@/a" ){
        return 6
    }
    return 0
}