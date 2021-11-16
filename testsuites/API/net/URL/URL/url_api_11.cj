// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
func main(): Int64 {
    var i = "http://foo.com?a=b"
    var i1 = "https:bar.com?1=4"
    let s = URL.parse(i).getOrThrow()
    let s1 = URL.parseRequestURI(i).getOrThrow()
    let s2 = URL.parse(i1).getOrThrow()
    let s3 = URL.parseRequestURI(i1).getOrThrow()
    var d = s.query()
    var d1 = s1.query()
    var d2 = s2.query()
    var d3 = s3.query()
    if( case01(d,"a") != "b"){
        return 1
    }
    if( case01(d1,"a") != "b"){
        return 2
    }
    if( case01(d2,"1") != "4"){
        return 3
    }
    if( case01(d3,"1") != "4"){
        return 4
    }
    return 0
}
func case01(z:Form,x:String){
    var a = z.get(x)
    return match (a){
        case Some(y) => y
        case $None =>"No"
    }
}