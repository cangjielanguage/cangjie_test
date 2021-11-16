// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Int16>()
var a2 = Array<Int16>()


func main(): Int64 {
    if(a1 != a2){
        return 1
    }

    return 0
}
