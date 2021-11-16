// EXEC: %compiler %cmp_opt -overflow wrapping %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var u16Number: UInt16 = 65535
    var u32Number: UInt32 = 0
    u32Number = UInt32(u16Number)  // ok: u32Number = 65535
    u16Number = UInt16(u32Number)  // ok: u16Number = 65535
    u32Number = 65536
    u16Number = UInt16(u32Number)  // throw an ArithmeticException
    print("${u16Number}")
    return 0
}

