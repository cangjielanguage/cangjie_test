// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    let emptyList : List<Int64> = []  // empty List<Int64>
    let list0 = [1, 2, 3,*emptyList, 3, 2, 1]  // list0 = [1, 2, 3, 3, 2, 1]
    let list1 = [4, 5, 6]  
    let list2 = [1, 2, 3, *list1, 3, 2, 1]  // list2 = [1, 2, 3, 4, 5, 6, 3, 2, 1]
    let list7 = [*[[1,2,3]]]  // list7 = [[1,2,3]]
    let list8 = [*[[1,2,3]],[4,5],[6,7,8]]  // list8 = [[1,2,3],[4,5],[6,7,8]]
    for(i in list2){
       print("${i}")
    }
    return 0
}

