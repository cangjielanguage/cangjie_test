// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    var a1 = Array<String>(["aa","bb","cc"])

    if(a1[0]=="aa" && a1[1]=="bb" && a1[2]=="cc" ){
        return 0
    }

    return 1
}
