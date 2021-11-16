// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {

    var arr = Array<String>(["if","else"])
    var t:String = ""

    if(arr[0] == "if"){
        var arr2 = Array<String>(["else","if"])
        t=arr2[0]
    }

    if(t == "else"){
        return 0
    }

    return 1
}
