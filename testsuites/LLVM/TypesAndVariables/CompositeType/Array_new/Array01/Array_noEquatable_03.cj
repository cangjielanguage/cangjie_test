// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<String>(["a","b","c"])
var a2 = Array<String>(["a","b","c"])
var a3 = Array<String>(["1","b","c"])

func main(): Int64 {
    if(a1!=a3){
        print("a1!=a3")
        if(a2!=a1){
            return 1
        }
    }
    return 0
}

