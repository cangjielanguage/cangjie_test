// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A{
	var a:Int64
    var b:Int64
    init(a:Int64,b:Int64){
        this.a=a
        this.b=b
    }
}


var a1 = Array<A>([A(0,0),A(1,1)])

a1.sortDescending()

func main(): Int64 {

    if(a1[0].a==1 && a1[0].b==1 && a1[1].a==0 && a1[1].b==0 ){
        return 0
    }

    return 1
}