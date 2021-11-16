// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com/file%20one%26two"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i).getOrThrow()
    var d = s.hostname()
    var d1 = s1.hostname()
    if( d != "www.google.com"){
        return 1
    }
    if( d1 != "www.google.com"){
        return 2
    }
    return 0
}