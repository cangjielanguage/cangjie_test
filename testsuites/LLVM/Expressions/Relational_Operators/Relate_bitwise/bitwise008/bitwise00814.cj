// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 位操作符应用于api
func main(): Int64 {
    var a = (!10>>1).toString()
    if (a == "-6") {
        return 0
    }
    return 1
}