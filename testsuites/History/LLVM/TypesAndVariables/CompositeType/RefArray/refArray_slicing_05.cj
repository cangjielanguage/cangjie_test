// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 12
// ASSERT: scan-not 345

func main(): Int64 {
    let arr : RefArray<Int64> = RefArray<Int64>([1,2,3,4,5])
    for( i in arr[..2]){
      print(i.toString())
    }
    return 0
}
