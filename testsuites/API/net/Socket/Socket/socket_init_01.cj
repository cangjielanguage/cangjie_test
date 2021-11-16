// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import net.*
func main()
{
    //net:TCP|UDP
    var socket1 = Socket(TCP,"127.0.0.1", 20202)
    var socket2 = Socket(UDP,"127.0.0.1", 20202)
    //ipv4:0.0.0.0~255.255.255.255
    var socket3= Socket(TCP,"255.255.255.255", 20202)
    var socket4= Socket(TCP,"10.67.134.148", 20202)
    var socket5= Socket(TCP,"0.0.0.0", 20202)

    //ipv6:0000:0000:0000:0000:0000:0000:0000:0000 至 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
    var socket31= Socket(TCP,"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 20202)
    var socket41= Socket(TCP,"2000:0:0:0:0:0:0:1", 20202)
    var socket51= Socket(TCP,"0:0:0:0:0:0:0:0", 20202)
    //port：0~65535
    var socket6 = Socket(TCP,"127.0.0.1", 0)
    var socket7 = Socket(TCP,"127.0.0.1", 65535)
    var socket8 = Socket(TCP,"127.0.0.1", 65534)
    print("success\n")
    return 0
}


