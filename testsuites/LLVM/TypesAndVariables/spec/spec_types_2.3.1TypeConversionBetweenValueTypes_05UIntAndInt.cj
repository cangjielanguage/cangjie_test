// EXEC: %compiler %cmp_opt -overflow wrapping %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var i8Number: Int8 = 127
    var u8Number: UInt8 = 0
    u8Number = UInt8(i8Number)  // ok: u8Number = 127
    u8Number = 100
    i8Number = Int8(u8Number)  // ok: i8Number= 100
    i8Number= -100
    u8Number = UInt8(i8Number)  // throw an ArithmeticException
    u8Number = 255
    i8Number = Int8(u8Number)  // throw an ArithmeticException
    return 0
}

