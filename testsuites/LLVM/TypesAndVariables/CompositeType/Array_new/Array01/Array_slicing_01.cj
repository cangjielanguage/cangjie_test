// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 12345

func main(): Int64 {
    let arr : Array<Int64> = Array<Int64>([1,2,3,4,5])
    let b = 0..5
    for( i in arr.slice(b)){
      print(i.toString())
    }
    return 0
}
