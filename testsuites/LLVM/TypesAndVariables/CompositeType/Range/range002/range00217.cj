// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

func main(): Int64 {
    var a : Array<Int64> = Array<Int64>([0,1,2,3,4,5,6,7,8,9])
    let b = Int64(20)..50:1
    for (i in b){
      print(i.toString())
    }
    var res : Int64 = 0
    for (i in a[b]) {
        res = res + i
    }
    return 0
}
