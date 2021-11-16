// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*
func main()
{
    //net:TCP|UDP
    var socket1 = Socket(Mash,"127.0.0.1", 20202)  //EXPECTED: regex error.*?no matching constructor for call 'Socket'
    //port：0~65535
    var socket2 = Socket(TCP,"127.0.0.1", 65536)//EXPECTED: regex error.*?no matching constructor for call 'Socket'
    print("success\n")
    return 0
}