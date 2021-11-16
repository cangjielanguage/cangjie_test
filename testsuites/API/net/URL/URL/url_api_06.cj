// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com/file%20one%26two"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i).getOrThrow()
    var d = s.escapedPath()
    var d1 = s1.escapedPath()
    if( d != "/file%20one%26two"){
        return 1
    }
    if( d1 != "/file%20one%26two"){
        return 2
    }
    return 0
}