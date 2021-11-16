// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var t:Bool = true
    var f:Bool = false
    var i:Int32 = 0
    var j:Int32 = 0
    if (i > 0) {
        return 1
    }
    else if (i < 0) {
        return 1
    }
    else {
        return 0
    }
    }