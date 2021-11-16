// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.122.cn/a/b~/12c"
    var i1 = "b/c/file/~12"
    let s = URL.parseRequestURI(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http://www.122.cn/a/b~/12c"){
        return 1
    }
    if( d1 != "b/c/file/~12"){
        return 2
    }
    if( s.path != "/a/b~/12c"){
        return 3
    }
    if( s1.path != "b/c/file/~12"){
        return 4
    }
    return 0
}