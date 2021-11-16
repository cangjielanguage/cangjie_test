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
    header.add("Set-Cookie","NID=99=YsDT5i3E-CXax-; expires=Wed, 23-Nov-2011 01:05:03 GMT; path=/; domain=.google.ch; HttpOnly ;samesite=strict")
    header.add("Set-Cookie","NID=100=YsDT5i3E-CXax-; expires=Wed, 23-Nov-2011 01:05:03 GMT; path=/; domain=.google.ch; HttpOnly ;samesite=strict")
    var trailer=Header()
    trailer.add("E","A")
    trailer.add("F","B")
    trailer.add("G","C")
    var response1 = Response("HTTP/1.0","",500,1,0,header,trailer,true,-1,StringStream("abcdefsdf"),Array<String>(1,{i => "chunked"}) )
    var array1 = response1.cookies()
    var a = array1[0]
    var a1 = array1[1]
    if(array1.size() != 2){
        return 1
    }
    if( a.toString() != "NID=99=YsDT5i3E-CXax-; Path=/; Domain=google.ch; Expires=2011-11-23T01:05:03Z; HttpOnly; SameSite=Strict"){
        return 2
    }
    if( a1.toString() != "NID=100=YsDT5i3E-CXax-; Path=/; Domain=google.ch; Expires=2011-11-23T01:05:03Z; HttpOnly; SameSite=Strict"){
        return 3
    }
    return 0
}