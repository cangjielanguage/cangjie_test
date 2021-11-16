// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 1234512345

func main(): Int64 {
    let arr : Array<Int64> = Array<Int64>([1,2,3,4,5])
    let b = 0..5:1
    for( i in arr[b]){
      print(i.toString())
    }

    for( i in arr[..]){
      print(i.toString())
    }
    return 0
}
