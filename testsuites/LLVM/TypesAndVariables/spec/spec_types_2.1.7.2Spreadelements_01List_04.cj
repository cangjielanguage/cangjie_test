// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
//  map<Int64,Int64>([0, 1, 2, 3, 4], \x => x + 4) = [4, 5, 6, 7, 8]
//  map<Int64, Int64>([0, 1, 2, 3, 4],\x => x + 4) Unrealized
//  let list12 = [1, 2, 3, *(map<Int64, Int64>([0, 1, 2, 3, 4],\x => x + 4))]  
    let list122 = [1, 2, 3,*[4, 5, 6, 7, 8]]    
    for(i in list122){
        print("${i}")
    }
//  map<Int64, Int64>([10, 20, 30],\x => x / 10) Unrealized
//  let list13 = [1, 2, 3, *(map<Int64, Int64>([10, 20, 30],\x => x / 10))]
    let list133 = [1, 2, 3, *[1, 2, 3]]
    for(j in list133){
        print("${j}")
    }
    return 0
}

