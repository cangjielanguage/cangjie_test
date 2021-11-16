// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com?as!=3ae#2Ab"
    var i1 = "http:other.example.com?1a;=A53#Ab1"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http://www.google.com?as!=3ae#2Ab"){
        return 1
    }
    if( d1 != "http:other.example.com?1a;=A53#Ab1"){
        return 2
    }
    if( s.fragment != "2Ab"){
        return 3
    }
    if( s1.fragment != "Ab1"){
        return 4
    }
    return 0
}