// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http1.://!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@=3b#@17"
    var i1 = "http1.://!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@=3b"
    var i2 = "http1.:!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@=3b#@35"
    var i3 = "http1.:!$&#-ab:12!$&@www.baidu.com:14/a/b/a?1@=3b"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    let s2 = URL.parse(i2).getOrThrow()
    let s3 = URL.parseRequestURI(i3).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if( d != "http1.://!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@=3b#@17"){
        return 1
    }
    if( d1 != "http1.://!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@=3b"){
        return 2
    }
    if( d2 != "http1.:!$&-ab:12!$&@www.baidu.com:14/a/b@/a?1@=3b#@35"){
        return 3
    }
    if( d3 != "http1.:!$&#-ab:12!$&@www.baidu.com:14/a/b/a?1@=3b"){
        return 4
    }
    if( s.user.toString() != "!$&-ab:12!$&" ){
        return 5
    }
    if( s1.user.toString() != "!$&-ab:12!$&" ){
        return 6
    }
    if( s2.user.toString() != "" ){
        return 7
    }
    if( s3.user.toString() != "" ){
        return 8
    }
    return 0
}