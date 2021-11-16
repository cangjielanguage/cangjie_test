// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let arr : Array<Int64> = Array<Int64>([1,2,3,4,5])
    var sum = 0
    for(i in arr){
      sum += i
    }
    return sum - 15
}