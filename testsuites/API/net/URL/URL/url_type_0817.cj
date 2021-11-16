// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http5+://~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#Ab9!$&-8a"
    var i1 = "http5+://www~.bai~du.com:98/b.32Aa/b?ab.=34Ab.#?.4asA'()"
    var i2 = "http5+:?ab.=34Ab.#?4a_sA*+,"
    var i3 = "http5+:~_Ab:~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#;=A18~a"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parse(i1).getOrThrow()
    let s2 = URL.parse(i2).getOrThrow()
    let s3 = URL.parse(i3).getOrThrow()
    var d = s.toString()
    var d1 = s1.toString()
    var d2 = s2.toString()
    var d3 = s3.toString()
    if( d != "http5+://~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#Ab9!$&-8a"){
        return 1
    }
    if( d1 != "http5+://www~.bai~du.com:98/b.32Aa/b?ab.=34Ab.#?.4asA'()"){
        return 2
    }
    if( d2 != "http5+:?ab.=34Ab.#?4a_sA*+,"){
        return 3
    }
    if( d3 != "http5+:~_Ab:~1abc@www~.bai~du.com:98/a/b~79123?asd21~=~Ab#;=A18~a"){
        return 4
    }
    if( s.fragment != "Ab9!$&-8a"){
        return 5
    }
    if( s1.fragment != "?.4asA'()"){
        return 6
    }
    if( s2.fragment != "?4a_sA*+,"){
        return 7
    }
    if( s3.fragment != ";=A18~a") {
        return 8
    }
    return 0
}