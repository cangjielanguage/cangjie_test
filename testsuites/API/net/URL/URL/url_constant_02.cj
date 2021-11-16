// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com/file%20one%26two"
    var i1 = "https:1www.google.com/file%20one%26two"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    var b = s.opaque
    var b1 = s1.opaque
    if( b != ""){
        return 1
    }
    if( b1 != "1www.google.com/file%20one%26two"){
        return 2
    }
    return 0
}