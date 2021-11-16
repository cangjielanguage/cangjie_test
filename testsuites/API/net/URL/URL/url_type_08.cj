// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http1.://other.example.com/a/b"
    var i1 = "http2-://other.example.com/a/b"
    var i2 = "http5+:#1as"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    let s2 = URL.parse(i2).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    if( d != "http1.://other.example.com/a/b"){
        return 1
    }
    if( d1 != "http2-://other.example.com/a/b"){
        return 2
    }
    if( d2 != "http5+:#1as"){
        return 3
    }
    return 0
}