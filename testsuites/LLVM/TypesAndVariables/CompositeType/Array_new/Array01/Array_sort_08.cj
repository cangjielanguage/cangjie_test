// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
	A(var ra!: Int64 = 0, let rb!: Int64 = 0){

	}
}

var a1 = Array<A>([A(ra:2,rb:2),A(ra:1,rb:1)])

a1.sort()

func main(): Int64 {

    if(a1[0].ra!=1 || a1[0].rb!=1 || a1[1].ra!=2 || a1[1].rb!=2 ){
        return 1
    }

    return 0
}
