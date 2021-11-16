// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func define02(data!:Array<Int32>=Array<Int32>([1,-5,6])){
    return data
}

func main(): Int64 {

    let a=define02()
    let b=define02(data:Array<Int32>([2,-3,6]))

    if(a[0]==1 && a[1] ==-5 && a[2]==6 && b[0]==2 && b[1]==-3 && b[2]==6 ){
        return 0
    }

    return 1
}
