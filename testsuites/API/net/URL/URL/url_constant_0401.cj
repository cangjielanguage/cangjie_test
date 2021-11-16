// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com:8989/file%20one%26two"
    var i1 = "https:www.google.com/file%20one%26two"
    let s = URL.parseRequestURI(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    var b = s.host
    var b1 = s1.host
    if( b != "www.google.com:8989"){
        return 1
    }
    if( b1 != ""){
        return 2
    }
    return 0
}