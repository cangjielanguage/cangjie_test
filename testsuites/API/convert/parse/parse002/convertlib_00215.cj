// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import convert.*


func parseInt8(x:String):String {
    return x
}

func parseFloat16(x:String):String {
    return x
}

func main(): Int64 {
    var a = parseInt8("50")
    var b = parseFloat16("50")

    if (a == "50" && b == "50") {
        return 0
    }
    return 1
}