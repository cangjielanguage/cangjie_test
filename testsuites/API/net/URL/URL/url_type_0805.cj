// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http1.://1-ab:12-3@-www.-baidu.com:14/a/b"
    var i1 = "http2-://.other.example.com:78/a/b"
    var i2 = "http5+://9_Ab:2a_4@www_.baidu._com:78/a/b"
    var i3 =  "http5+://~_Ab:~1abc@www~.bai~du.com:98/a/b"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    let s2 = URL.parse(i2).getOrThrow()
    let s3 = URL.parseRequestURI(i3).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if( d != "http1.://1-ab:12-3@-www.-baidu.com:14/a/b"){
        return 1
    }
    if( d1 != "http2-://.other.example.com:78/a/b"){
        return 2
    }
    if( d2 != "http5+://9_Ab:2a_4@www_.baidu._com:78/a/b"){
        return 3
    }
    if( d3 != "http5+://~_Ab:~1abc@www~.bai~du.com:98/a/b"){
        return 4
    }
    if( s.host != "-www.-baidu.com:14"){
        return 5
    }
    if( s1.host != ".other.example.com:78"){
        return 6
    }
    if( s2.host != "www_.baidu._com:78"){
        return 7
    }
    if( s3.host != "www~.bai~du.com:98") {
        return 8
    }
    return 0
}