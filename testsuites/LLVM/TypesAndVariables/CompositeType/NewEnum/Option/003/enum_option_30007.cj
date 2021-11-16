// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var a : ??Int64 = 1
    var b : ?Int64 =  a??2
    var c : Int64 = b ?? 3
    return c - 1
}
