// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Float32 = 2.4e-1
    a--
    a++
    var b:Float16 = 2.4e-1
    return 0
}