// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Float32>([1.0,5.25,1.002,5.222,1.001])

func comp(lhs:Float32, rhs:Float32):Bool{
    if (lhs > rhs) {
        return true
    }else{
        return false
    }
}

func main(): Int64 {

    a1.sortBy(comp)

    if(a1[0]==5.25 && a1[1]==5.222 && a1[2]==1.002 && a1[3]==1.001 && a1[4]==1.0 ){
        return 0
    }
    return 1
}
