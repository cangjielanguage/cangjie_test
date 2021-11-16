// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*
func main(): Int64 {
    var header=Header()
    header.add("111","999")
    header.add("111","888")
    header.add("222","333")
    header.add("333","444")
    var trailer=Header()
    trailer.add("E","A")
    trailer.add("F","B")
    trailer.add("G","C")
    var response1 = Response("HTTP/1.0","",500,1,0,header,trailer,false,-1,StringStream("abcdefsdf"),Array<String>(1,{i => "chunked"}) )
    var response2 = Response()
    var bool1 = response1.protoAtLeast(3,2)
    var bool2 = response1.protoAtLeast(2,1)
    var bool3 = response1.protoAtLeast(1,2)
    var bool4 = response2.protoAtLeast(1,-1)
    if(bool1 != false){
        return 1
    }
    if(bool2 != false){
        return 2
    }
    if(bool3 != false){
        return 3
    }
    if(bool4 != false){
        return 4
    }
    return 0
}