// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<UInt64>([1,5,2,0,8])

func comp(lhs:UInt64, rhs:UInt64):Bool{ 
    if (lhs > rhs){
        return true
    }else{
        return false
    }
}

func main(): Int64 {

    a1.sortBy(comp)

    if(a1[0]==8 && a1[1]==5 && a1[2]==2 && a1[3]==1 && a1[4]==0 ){
        return 0
    }
    return 1
}
