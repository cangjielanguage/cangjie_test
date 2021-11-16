// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 54321

func main(): Int64 {
    let arr : RefArray<Int64> = RefArray<Int64>([1,2,3,4,5])
    let b = 4..=0:-1
    for( i in arr[b]){
      print(i.toString())
    }
    return 0
}
