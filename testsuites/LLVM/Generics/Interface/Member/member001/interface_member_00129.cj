// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<X,Y>{
    static func t():Int32{1}
}

class A <: I<Int32,Int32> {
    var a :Int32 = t()
}

func main(){
if (A().a != Int32(1)) {
    return 1
}
return 0
}