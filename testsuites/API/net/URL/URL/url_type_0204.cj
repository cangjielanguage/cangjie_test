// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://121www.asd12.%E4%BD%A0com%40:789ad@110.8.8.10:50"
    var i1 = "http://121www.asd12.com:%3A22789%E4%BD%A0ewweq@www.baadsd.com:8080"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http://121www.asd12.你com@:789ad@110.8.8.10:50"){
        return 1
    }
    if( d1 != "http://121www.asd12.com::22789你ewweq@www.baadsd.com:8080"){
        return 2
    }
    if( s.user.toString() != "121www.asd12.你com@:789ad" ){
        return 3
    }
    if( s1.user.toString() != "121www.asd12.com::22789你ewweq" ){
        return 4
    }
    return 0
}