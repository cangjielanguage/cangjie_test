// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://foo.com/a?a=b#f"
    var i1 = "https:bar.com?1=4"
    var i2 = "http://foo.com/a"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    let s2 = URL.parse(i1).getOrThrow()
    let s3 = URL.parseRequestURI(i2).getOrThrow()
    let s4 = URL.parse(i2).getOrThrow()
    var d = s.requestURI()
    var d1 = s1.requestURI()
    var d2 = s2.requestURI()
    var d3 = s3.requestURI()
    var d4= s4.requestURI()
    if( d != "/a?a=b"){
        return 1
    }
    if( d1 != "bar.com?1=4"){
        return 2
    }
    if( d2 != "bar.com?1=4"){
        return 1
    }
    if( d3 != "/a"){
        return 2
    }
    if( d3 != "/a"){
        return 2
    }
    return 0
}