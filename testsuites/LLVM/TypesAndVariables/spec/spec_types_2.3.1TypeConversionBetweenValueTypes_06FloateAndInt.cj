// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var i32Number: Int32 = 1024
    var f16Number: Float16 = 0.0
    var f32Number: Float32 = 0.0
    f16Number = Float16(i32Number)  // ok: f16Number = 1024.0
    f32Number = Float32(i32Number)  // ok: f32Number = 1024.0
    i32Number = 2147483647
    f16Number = Float16(i32Number)  // f16Number = POSITIVE_INFINITY
    f32Number = Float32(i32Number)  // precision lost: f32Number = 2.14748365E9
    f32Number = 1024.1024
    i32Number = Int32(f32Number)  // ok: i32Number = 1024
    f32Number = 1024e10
    i32Number = Int32(f32Number)  // throw an ArithmeticException: (Int32)f32Number is not in the range of Int32
    f32Number = 3.4e40  // f32Number = POSITIVE_INFINITY
    i32Number = Int32(f32Number)  // throw an ArithmeticException
    f32Number = 3.4e40 * 0.0  // f32Number = NaN
    i32Number = Int32(f32Number)  // throw an ArithmeticException
    return 0
}

