// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com/file%20one%26two?1=3"
    var i1 = "http:other.example.com/%2F/%2F/?1=3"
    let s = URL.parse(i).getOrThrow()
    let s1= URL.parse(i1).getOrThrow()
    var d =s.toString()
    var d1 =s1.toString()
    if( d != "http://www.google.com/file%20one%26two?1=3"){
        return 1
    }
    if( d1 != "http:other.example.com/%2F/%2F/?1=3"){
        return 2
    }
    return 0
}