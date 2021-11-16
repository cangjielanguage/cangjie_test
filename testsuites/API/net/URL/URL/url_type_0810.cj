// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http1.:/!$&a12-:/b"
    var i1 = "@b.32Aa/'()b"
    let s = URL.parseRequestURI(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http1.:///!$&a12-:/b"){
        return 1
    }
    if( d1 != "@b.32Aa/'()b"){
        return 2
    }
    if( s.path != "/!$&a12-:/b"){
        return 3
    }
    if( s1.path != "@b.32Aa/'()b"){
        return 4
    }
    return 0
}