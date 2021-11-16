// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Float16 = Float16(0b01)
    var b:Float32 = Float32(0b01)
    var c:Float64 = Float64(0b01)
    return 0
}