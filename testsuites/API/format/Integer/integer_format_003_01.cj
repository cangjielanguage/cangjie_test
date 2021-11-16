// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: regex IllegalArgumentException


from std import format.*

func main():Int64 {
    var a: UInt32 = 20
    var b: Int64 = -20
    var c = 0
    var res = a.format("#h")  // error
    return 0

}