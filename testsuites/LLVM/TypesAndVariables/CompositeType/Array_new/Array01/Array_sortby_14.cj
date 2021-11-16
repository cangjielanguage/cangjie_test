// EXEC: %compiler %cmp_opt %f -o %output

var a1 = Array<Float32>([1.0,5.25,1.002,5.222,1.001])

func comp(data1:Float32,data2:Float32):Bool{
    return true
}

func main(): Int64 {

    a1.sortBy(comp)

    if(a1[0]==1.0 && a1[1]==5.25 && a1[2]==1.002 && a1[3]==5.222 && a1[4]==1.001 ){
        return 0
    }
    return 1
}
