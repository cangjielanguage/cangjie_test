// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var uBase = "http://foo.com?a=b"
    var uref = "http://sss.com/a"
    let s1 = URL.parse(uBase).getOrThrow()
    let s2 = URL.parse(uref).getOrThrow()
    var ss =s1.resolveReference(s2)
    var d= ss.toString()
    if( d != "http://sss.com/a"){
        return 1
    }
    return 0
}