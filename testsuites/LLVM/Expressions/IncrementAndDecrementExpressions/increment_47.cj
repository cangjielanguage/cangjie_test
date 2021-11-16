// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var i = 3
var lmd = {  => i++;i}

func main(): Int64 {
    var res = lmd()
    res++
    res--
    if (res == 4) {
        return 0
    }
    return 1
}