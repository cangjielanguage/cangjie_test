// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<String>(["aa","bb","dd","cc"])

func comp(lhs:String, rhs:String):Bool{
    if (lhs < rhs){
        return true
    }else{
        return false
    }
}

func main(): Int64 {

    a1.sortBy(comp)

    if(a1[0]=="aa" && a1[1]=="bb" && a1[2]=="cc" && a1[3]=="dd" ){
        return 0
    }

    return 1
}
