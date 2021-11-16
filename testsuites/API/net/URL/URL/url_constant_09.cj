// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://10.110.8.8:8080/file%20one%26two?a=b#af%20one%26two"
    var i1 = "https:www.google.com/a/b?1=2#56%20one%26two"
    var i2 = "http://10.110.8.8:8080/file%20one%26two"
    var i3 = "https:www.google.com/a/b"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    let s2 = URL.parse(i2).getOrThrow()
    let s3 = URL.parse(i3).getOrThrow()
    var b = s.fragment
    var b1 = s1.fragment
    var b2 = s2.fragment
    var b3 = s3.fragment
    if( b != "af one&two"){
        return 1
    }
    if( b1 != "56 one&two"){
        return 2
    }
    if( b2 != ""){
        return 3
    }
    if( b3 != ""){
        return 4
    }
    return 0
}