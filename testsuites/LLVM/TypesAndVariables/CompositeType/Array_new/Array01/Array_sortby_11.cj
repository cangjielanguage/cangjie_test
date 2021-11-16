// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A {
	A(var ra!: Int64 = 0, let rb!: Int64 = 0){

	}
}

var a1 = Array<A>([A(ra:4,rb:1),A(ra:1,rb:1)])

func comp(lhs:A, rhs:A):Bool{
    
    if(rhs.ra-lhs.ra>0){
        return true
    }else{
        return false
    }
}

func main(): Int64 {
    
    a1.sortBy(comp)

    if(a1[0].ra==1 && a1[0].rb==1 && a1[1].ra==4 && a1[1].rb==1 ){
        return 0
    }

    return 1
}