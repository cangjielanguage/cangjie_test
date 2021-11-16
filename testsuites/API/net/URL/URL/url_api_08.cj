// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "quux/./dotdot/.././tail"
    let s = URL.parse(i).getOrThrow()
    var d = s.isAbs()
    if( d != false){
        return 1
    }
    return 0
}