// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    let list11 = [1, 2, 3, *(if (1<2) {[4, 5]} else {[6, 7]})]
//    print("${list11}") // output: [1, 2, 3, 4, 5]
    for(i in list11){
        print("${i}")
    }
    return 0
}

