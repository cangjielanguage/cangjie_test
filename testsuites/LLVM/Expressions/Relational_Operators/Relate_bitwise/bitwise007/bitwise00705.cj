// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a:Int32 = 7
    var b:Int32 = 2
    var c:Int32 = 0
    var d:Int32 = 0
    var e:Int32 = 10
    c = a|e^b
    d = a|(e^b)
    if (c != d) {
        return 1
    }
    return 0 
}