// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://10.110.8.8:8080/file%20one%26two?a=b"
    var i1 = "https:www.google.com/a/b?1=2"
    var i2 = "http://10.110.8.8:8080/file%20one%26two"
    var i3 = "https:www.google.com/a/b?"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    let s2 = URL.parse(i2).getOrThrow()
    let s3 = URL.parse(i3).getOrThrow()
    var b = s.forceQuery
    var b1 = s1.forceQuery
    var b2 = s2.forceQuery
    var b3 = s3.forceQuery
    if( b != false){
        return 1
    }
    if( b1 != false){
        return 2
    }
    if( b2 != false){
        return 3
    }
    if( b3 != true){
        return 4
    }
    return 0
}