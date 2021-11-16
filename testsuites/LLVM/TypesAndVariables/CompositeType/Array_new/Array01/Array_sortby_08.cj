// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
	var a:Int64
    init(a:Int64){
        this.a=a
    }
}

var a1 = Array<A>([A(1),A(2)])

func comp(lhs:A, rhs:A):Bool{
    if (lhs.a-rhs.a>0 ){
        return true
    }else{
        return false
    }
}

func main(): Int64 {

    a1.sortBy(comp)

    if(a1[0].a!=2 || a1[1].a!=1 ){
        return 1
    }

    return 0
}
