// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://110.10.8.8"
    var i1 = "https://168.192.0.5:41"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http://110.10.8.8"){
        return 1
    }
    if( d1 != "https://168.192.0.5:41"){
        return 2
    }
    if( s.host != "110.10.8.8"){
        return 3
    }
    if( s1.host != "168.192.0.5:41"){
        return 4
    }
    return 0
}