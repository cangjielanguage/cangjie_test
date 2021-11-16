// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
//failure cause: octal num is not supported for now
func main(): Int64 {
    var a:Int8 = 0o30
    var b:Int8 = 0
    var c:Int8 = -25
    b = !a
    if (b != c) {
        return 1
    }
    return 0 
}