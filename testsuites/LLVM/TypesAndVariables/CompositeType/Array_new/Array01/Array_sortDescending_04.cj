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


var a1 = Array<A>([A(ra:2,rb:2),B(rc:0,rd:0),A(ra:1,rb:1)])

a1.sortDescending()

func main(): Int64 {

    if(a1[0].ra==2 && a1[0].rb==2 && a1[1].ra==1 && a1[1].rb==1 && a1[2].ra==0 && a1[2].rb==0 ){
        return 0
    }

    return 1
}
