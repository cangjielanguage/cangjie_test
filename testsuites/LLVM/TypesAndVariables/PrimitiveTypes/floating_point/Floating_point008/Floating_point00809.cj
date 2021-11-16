// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Float32 = .123e2
    var b:Float16 = .123e2
    return 0
}