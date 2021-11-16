// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com"
    var i1 = "Https:other.example.com/%2F/%2F/"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    let s2 = URL.parseRequestURI(i).getOrThrow()
    let s3 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.escapedPath()
    var d1 = s1.escapedPath()
    var d2 = s2.escapedPath()
    var d3 = s3.escapedPath()
    if( d != ""){
        return 1
    }
    if( d1 != "" ){
        return 2
    }
    if( d2 != ""){
        return 1
    }
    if( d3 != "" ){
        return 2
    }
    return 0
}