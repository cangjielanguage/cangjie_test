// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{
    var a1 = Array<Float64>([1.0,2.0,3.0])
}

class B <: A{
    var a2 = Array<Float64>([1.0,2.0,3.0])
}

func main(): Int64 {
    var b = B()

    if(b.a2[0] == 1.0 && b.a2[1] == 2.0 && b.a2[2]==3.0 && B().a1[0] == 1.0 && B().a1[1] == 2.0 && B().a1[2]==3.0 ){
        return 0
    }

    return 1
}
