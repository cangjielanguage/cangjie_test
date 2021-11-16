// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    let emptyList : List<Int64> = []  // empty List<Int64>
    let list0 = [1, 2, 3, 3, 2, 1]  // list0 = [1, 2, 3, 3, 2, 1]
    let list1 = [1 + 3, 2 + 3, 3 + 3]  // list1 = [4, 5, 6]
    for(i in list0){
       print("${i}")
    }
    print("\n")
    for(j in list1){
       print("${j}")
    }
    return 0
}

