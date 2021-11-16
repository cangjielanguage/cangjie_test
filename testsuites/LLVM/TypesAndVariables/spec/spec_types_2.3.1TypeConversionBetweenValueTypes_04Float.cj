// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var f32Number: Float32 = 1.1
    var f64Number: Float64 = 0.0
    f64Number = Float64(f32Number)  // f64Number = 1.100000023841858
    f32Number = Float32(f64Number)  // f32Number = 1.1
    f64Number = 1.123456789
    f32Number = Float32(f64Number)  // f32Number = 1.1234568
    f32Number = 4.4E38  // f32Number = POSITIVE_INFINITY
    f64Number = Float64(f32Number)  // f64Number = POSITIVE_INFINITY
    f64Number = 4.4E38
    f32Number = Float32(f64Number)  // f32Number = POSITIVE_INFINITY
//    f64Number = f32Number*0.0
    f32Number = Float32(f64Number)  // f32Number = NaN
    return 0
}

