// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "?_1abc134-Ab=7qww-Ac"
    var i1 = "http5+://~_Ab:~1abc@www~.bai~du.com:98/b.32Aa/b?ab.=34Ab."
    var i2 = "a/b_89A?12a=mn_A"
    var i3 = "http5+:~_Ab:~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i1).getOrThrow()
    let s2 = URL.parse(i2).getOrThrow()
    let s3 = URL.parseRequestURI(i3).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if( d != "?_1abc134-Ab=7qww-Ac"){
        return 1
    }
    if( d1 != "http5+://~_Ab:~1abc@www~.bai~du.com:98/b.32Aa/b?ab.=34Ab."){
        return 2
    }
    if( d2 != "a/b_89A?12a=mn_A"){
        return 3
    }
    if( d3 != "http5+:~_Ab:~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab"){
        return 4
    }
    if( s.rawQuery != "_1abc134-Ab=7qww-Ac"){
        return 5
    }
    if( s1.rawQuery != "ab.=34Ab."){
        return 6
    }
    if( s2.rawQuery != "12a=mn_A"){
        return 7
    }
    if( s3.rawQuery != "asd21~=~Ab") {
        return 8
    }
    return 0
}