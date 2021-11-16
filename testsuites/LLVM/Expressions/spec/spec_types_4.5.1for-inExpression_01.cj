// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    let arr= Array<Int64>([0, 1, 2, 3, 4])
    for (i in arr) {
        print("${i}")  // output: 01234
    }
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    for (item in intList) {
        print("${item}")  // output: 01234
    }
    let intRange = 0..5
    for (number in intRange) if (number > 2) {
        print("${number}")  // output: 34
    }
 
    return 0
}

