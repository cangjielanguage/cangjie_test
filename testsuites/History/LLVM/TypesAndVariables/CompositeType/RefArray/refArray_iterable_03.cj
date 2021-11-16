// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let arr : RefArray<Int64> = RefArray<Int64>([1,2,3,4,5])
    let b = RefArray<Int64>(arr)
    arr.set(0, 100)
    var sum = 0
		for(i in b){
      sum += i
    }
    return sum - 15
}