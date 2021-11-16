// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com/file%20one%26two"
    let s = URL.parse(i).getOrThrow()
    var d =s.toString()
    if( d != "http://www.google.com/file%20one%26two"){
        return 1
    }
    return 0
}