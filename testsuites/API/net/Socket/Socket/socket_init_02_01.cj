// EXEC-PIPE-1: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import net.*
func main()
{
    //net:TCP|UDP
    var socket1 = Socket(Mash,"127.0.0.1",20202,"127.0.0.1",3333)  //EXPECTED: regex error.*?no matching constructor for call 'Socket'
    //port：0~65535
    var socket2 = Socket(TCP,"127.0.0.1",65536,"127.0.0.1",3333)//EXPECTED: regex error.*?the number '65536' exceeds the value range of type 'UInt16'
    var socket3 = Socket(TCP,"127.0.0.1",65535,"127.0.0.1",65536)//EXPECTED: regex error.*?the number '65536' exceeds the value range of type 'UInt16'
    print("success\n")
    return 0
}