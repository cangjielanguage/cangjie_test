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
    header.add("Location","http://123Aother.example.com/a/b")
    var trailer=Header()
    trailer.add("E","A")
    trailer.add("F","B")
    trailer.add("G","C")
    var response1 = Response("HTTP/1.0","",500,1,0,header,trailer,false,-1,StringStream("abcdefsdf"),Array<String>(1,{i => "chunked"}) )
    var a = response1.location().toString()
    if( a != "http://123Aother.example.com/a/b"){
        return 1
    }
    return 0
}