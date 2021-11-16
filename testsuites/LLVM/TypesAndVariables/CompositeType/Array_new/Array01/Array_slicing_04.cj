// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 345
// ASSERT: scan-not 12

func main(): Int64 {
    let arr : Array<Int64> = Array<Int64>([1,2,3,4,5])
    for( i in arr.slice(2..5)){
      print(i.toString())
    }
    return 0
}
