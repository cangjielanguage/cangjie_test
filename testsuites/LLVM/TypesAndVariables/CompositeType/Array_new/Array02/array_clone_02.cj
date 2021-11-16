// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let arr : Array<Int64> = Array<Int64>(5, {i => i+1 })
    let b = arr.clone()
    b[0] = 100
    if(arr[0]!=1 || arr[1]!=2 || arr[2]!=3 || arr[3]!=4 || arr[4]!=5 || b[0]!=100 || b[1]!=2 || b[2]!=3 || b[3]!=4 || b[4]!=5){
      return 2
    }
    return 0
}