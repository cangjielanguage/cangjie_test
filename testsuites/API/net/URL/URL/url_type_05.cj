// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://www.google.com?as!=3ae"
    var i1 = "http:other.example.com?1a;=A53"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i).getOrThrow()
    let s2 = URL.parse(i1).getOrThrow()
    let s3 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if( d != "http://www.google.com?as!=3ae"){
        return 1
    }
    if( d1 != "http://www.google.com?as!=3ae"){
        return 2
    }
    if( d2 != "http:other.example.com?1a;=A53"){
        return 3
    }
    if( d3 != "http:other.example.com?1a;=A53"){
        return 4
    }
    if( s.rawQuery != "as!=3ae"){
        return 5
    }
    if( s1.rawQuery != "as!=3ae"){
        return 6
    }
    if( s2.rawQuery != "1a;=A53"){
        return 7
    }
    if( s3.rawQuery != "1a;=A53"){
        return 8
    }
    return 0
}