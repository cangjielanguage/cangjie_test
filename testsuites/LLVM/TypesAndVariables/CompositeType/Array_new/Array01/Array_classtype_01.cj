// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{
	A(var ra!: Int64 = 0, let rb!: Int64 = 0){

	}
}

class B <:A{
	B(var rc!: Int64 = 0, let rd!: Int64 = 0,let re!:Int64){
        super()
	}
}

var a1 = Array<A>([A(ra:1,rb:1),B(rc:0,rd:0,re:0)])


func main(): Int64 {

    if(a1[0].ra!=1 || a1[0].rb!=1 || a1[1].ra!=0 || a1[1].rb!=0){
        return 1
    }

    return 0
}
