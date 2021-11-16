// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var a1 = Array<Array<Int8>>([Array<Int8>([1,5,2,0,8]),Array<Int8>([9,5,2,0,8])])

func comp(lhs:Array<Int8>, rhs:Array<Int8>):Bool{
    
    return lhs[0] < rhs[0]
}

func comp2(lhs:Int8, rhs:Int8):Bool{
    
    return lhs > rhs
}

func main(): Int64 {

    a1.sortBy(comp)
    a1[0].sortBy(comp2)

    if(a1[0][0]==8 && a1[0][1]==5 && a1[0][2]==2 && a1[0][3]==1 && a1[0][4]==0 ){
        return 0
    }
    return 1
}
