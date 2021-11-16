// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "#"
    let s = URL.parse(i).getOrThrow()
    var d = s.toString()
    if( d != ""){
        return 1
    }
    if( s.fragment != ""){
        return 2
    }
    return 0
}