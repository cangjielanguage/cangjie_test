// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com@/file%20one%26two"
    var i1 = "https:www.google.com/file%20one%26two"
    let s = URL.parseRequestURI(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    var b = s.user
    var b1 = s1.user
    var a = b.toString()
    var a1 = b1.toString()
    if( a != "www.google.com"){
        return 1
    }
    if( a1 != ""){
        return 2
    }
    return 0
}