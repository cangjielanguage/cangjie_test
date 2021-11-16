// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://foo.com/bar/baz"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i).getOrThrow()
    var d = s.isAbs()
    var d1 = s1.isAbs()
    if( d != true){
        return 1
    }
    if( d1 != true){
        return 2
    }
    return 0
}