// EXEC: %compiler %cmp_opt -overflow wrapping %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var i8Number: Int8 = 127
    var i16Number: Int16 = 0
    i16Number = Int16(i8Number)  // ok: i16Number = 127
    i8Number = Int8(i16Number)  // ok: i8Number = 127
    i16Number = 128
    i8Number = Int8(i16Number)  // throw an ArithmeticException 
    return 0
}

