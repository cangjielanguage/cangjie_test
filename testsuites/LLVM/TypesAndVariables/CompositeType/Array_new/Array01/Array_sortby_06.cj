// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Bool>([true,true,false])

func comp(lhs:Bool, rhs:Bool):Bool{
    if (!lhs && rhs){
        return true
    }else{
        return false
    }
}

func main(): Int64 {

    a1.sortBy(comp)
    print(a1[0].toString())

    if(a1[0]==false && a1[1]==true && a1[2]==true){
        return 0
    }
    return 1
}
