// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://121www.asd12.com:789ad@"
    var i1 = "http://121www.asd12.com:789ewweq@www.baadsd.com:8080"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http://121www.asd12.com:789ad@"){
        return 1
    }
    if( d1 != "http://121www.asd12.com:789ewweq@www.baadsd.com:8080"){
        return 2
    }
    return 0
}