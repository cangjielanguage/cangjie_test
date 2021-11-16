// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "a/b/c"
    var i1 = "b/c/file%20one%26two"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "a/b/c"){
        return 1
    }
    if( d1 != "b/c/file%20one%26two"){
        return 2
    }
    if( s1.path != "b/c/file one&two"){
        return 3
    }
    return 0
}