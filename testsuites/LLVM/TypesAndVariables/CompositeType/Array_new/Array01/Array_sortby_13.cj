// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Int32>([1,5,2,4,3])

func comp(data1:Int32,data2:Int32):Bool{
    return false
}

func main(): Int64 {
    a1.sortBy(comp)
    if(a1[0]==4 && a1[1]==3 && a1[2]==2 && a1[3]==1 && a1[4]==5 ){
        return 0
    }
    return 1
}
