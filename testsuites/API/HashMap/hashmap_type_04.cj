// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*

func main(): Int64 {
    var HashMap01:HashMap<String,Bool> = HashMap<String,Bool>([("a",true)])
    var value1 = HashMap01["a"]
    if (HashMap01.size() == 1 && value1 == true ){
        return 0
    }
    return 1
}
