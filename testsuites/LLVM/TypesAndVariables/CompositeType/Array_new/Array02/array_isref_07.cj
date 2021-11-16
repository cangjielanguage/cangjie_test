// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
	A(var ra!: Int64 = 0, let rb!: Int64 = 0){

	}
}

func main() {
    var arr : Array<A> = Array<A>([A(ra: 0, rb: 0)])
    var b = arr
    b[0].ra = 1
    return arr[0].ra - 1
}