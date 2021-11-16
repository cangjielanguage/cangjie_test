// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com#%232%E4%BD%A0Ab%25"
    var i1 = "http:?1a;=A53#%25%E4%BD%A0Ab1%23"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http://www.google.com##2你Ab%"){
        return 1
    }
    if( d1 != "http:?1a;=A53#%你Ab1#"){
        return 2
    }
    if( s.fragment != "#2你Ab%"){
        return 3
    }
    if( s1.fragment != "%你Ab1#"){
        return 4
    }
    return 0
}