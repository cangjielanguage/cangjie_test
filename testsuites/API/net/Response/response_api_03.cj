// EXEC: %compiler %stdx_run_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import net.*
from std import io.*
func main(): Int64 {
    var response1 = Response()
    var header=Header()
    header.add("111","999")
    header.add("111","888")
    header.add("222","333")
    header.add("333","444")
    header.add("Set-Cookie","NID=99=YsDT5i3E-CXax-; expires=Wed, 23-Nov-2011 01:05:03 GMT; path=/; domain=.google.ch; HttpOnly ;samesite=strict")
    var trailer=Header()
    trailer.add("E","A")
    trailer.add("F","B")
    trailer.add("G","C")
    var response2 = Response("HTTP/1.0","",500,1,0,header,trailer,false,-1,StringStream("abcdefsdf"),Array<String>(1,{i => "chunked"}) )
    var bool1 = response1.isClosed()
    var bool2 = response2.isClosed()
    if( bool1 != false){
        return 1
    }
    if( bool2 != false){
        return 2
    }
    return 0
}