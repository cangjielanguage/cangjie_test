// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args


from std import collection.*

func main(): Int64 {
    var a = 1..10:2
    var HashMap01:HashMap<Range<Int64>,String> = HashMap<Range<Int64>,String>([(a,"abc")])
    if( HashMap01.size() == 1 && HashMap01[a] == "abc" ){
        return 0
    }
    return 1
}