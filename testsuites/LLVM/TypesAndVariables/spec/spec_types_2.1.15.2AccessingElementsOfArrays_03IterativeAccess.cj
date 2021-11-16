// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func access() {
    let array8 :ArrayList<Int64>=ArrayList<Int64>([1, 8, 0, 1, 0])
    for (num in array8) {
        print("${num}")  // output: 18010
    }
}

func main(){
    access()
    let array9 :ArrayList<Int64>=ArrayList<Int64>([0, 1, 2, 3, 4, 5])
    let size1 = array9.size()  // size1 = 6
    return 0
}

