// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int64 = 10
    var b:Int64 = 1
    var c:Int64 = 0
    var d:Int64 = 28
    var e:Int64 = 8
    var f:Int64 = 15
    var g:Int64 = 24
    c = !!a<<b^e&f|g
    if (c != d) {
        return c
    }
    return 0 
}