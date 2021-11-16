// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    let emptyArr1 :ArrayList<Int64>=ArrayList<Int64>()
    let emptyArr2 :ArrayList<String>=ArrayList<String>()
    let array1 :ArrayList<Int64>=ArrayList<Int64>([0, 1, 2, 3, 4, 5])
    return 0
}

