// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var uBase = "http://foo.com?a=b"
    var uref = "a/../a/b"
    var uref1 = "a/a/b"
    let s1 = URL.parse(uBase).getOrThrow()
    let s2 = URL.parse(uref).getOrThrow()
    let s3 = URL.parse(uref1).getOrThrow()
    var ss =s1.resolveReference(s2)
    var ss1 =s1.resolveReference(s3)
    var d= ss.toString()
    var d1= ss1.toString()
    if( d != "http://foo.com/a/b"){
        return 1
    }
    if( d1 != "http://foo.com/a/a/b"){
        return 2
    }
    return 0
}