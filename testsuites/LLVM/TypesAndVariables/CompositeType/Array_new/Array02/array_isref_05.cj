// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record R{
	R(var ra!: Int64 = 0, let rb!: Int64 = 0){

	}
}

func main() {
    var arr : Array<R> = Array<R>([R(ra: 0, rb:0), R(ra: 1, rb: 1)])
    var b = arr
    b.set(0, R(ra: 1, rb: 1))
    if(arr[0].ra != 1 || arr[0].rb != 1 || arr[1].ra != 1 || arr[1].rb != 1){
      return 2
    }
    return 0
}