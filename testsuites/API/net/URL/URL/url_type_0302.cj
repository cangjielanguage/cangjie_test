// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://[fe80::1%25en0]:8080"
    var i1 = "http://[fe80::1%25%65%6e%301-._~]"
    var i2 = "http://[fe80::1]"
    var i3 = "http://[2001:DB8:0:23:8:800:200C:417A]:8080/foo"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    let s2 = URL.parse(i2).getOrThrow()
    let s3 = URL.parseRequestURI(i3).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if( d != "http://[fe80::1%25en0]:8080"){
        return 1
    }
    if( d1 != "http://[fe80::1%25en01-._~]"){
        return 2
    }
    if( d2 != "http://[fe80::1]"){
        return 3
    }
    if( d3 != "http://[2001:DB8:0:23:8:800:200C:417A]:8080/foo"){
        return 4
    }
    return 0
}