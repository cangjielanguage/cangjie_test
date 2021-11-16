// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int64 = -9223372036854775808
    var b:Int64 = 0
    var c:Int64 = 9223372036854775807
    b = !a
    print(b.toString())
    print("\n")
    if (b != c) {
        return 1
    }
    return 0
}
