// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{
	A(var ra!: Int64 = 0, let rb!: Int64 = 0){

	}
}

class B <:A{
	B(var rc!: Int64 = 0, let rd!: Int64 = 0){

	}
}


var a1 = Array<A>([B(rc:1,rd:1),A(ra:0,rb:0)])

a1.sort()

func main(): Int64 {

    if(a1[0].ra!=0 || a1[0].rb!=0 || a1[1].ra!=1 || a1[1].rb!=1 ){
        return 1
    }

    return 0
}
