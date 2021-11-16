// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http:other.example.com%E4%BD%A0/a/bfile%20one%26two"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    if( d != "http:other.example.com%E4%BD%A0/a/bfile%20one%26two"){
        return 1
    }
    if( d1 != "http:other.example.com%E4%BD%A0/a/bfile%20one%26two"){
        return 2
    }
    if( s.opaque != "other.example.com%E4%BD%A0/a/bfile%20one%26two"){
        return 3
    }
    if( s1.opaque != "other.example.com%E4%BD%A0/a/bfile%20one%26two"){
        return 4
    }
    return 0
}