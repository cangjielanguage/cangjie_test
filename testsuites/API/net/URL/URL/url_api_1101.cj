// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://foo.com"
    var i1 = "https:bar.com"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i).getOrThrow()
    let s2 = URL.parse(i1).getOrThrow()
    let s3 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.query()
    var d1 = s1.query()
    var d2 = s2.query()
    var d3 = s3.query()
    if( !(d is Form)){
        return 1
    }
    if( !(d1 is Form)){
        return 2
    }
    if( !(d2 is Form)){
        return 3
    }
    if( !(d3 is Form)){
        return 4
    }
    return 0
}
