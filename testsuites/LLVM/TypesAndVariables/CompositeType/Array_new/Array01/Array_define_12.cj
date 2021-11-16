// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    var a1 = Array<Float32>([1.0,2.0,3.0])
}


func main(): Int64 {
    var a = A()

    if(a.a1[0] == 1.0 && a.a1[1] == 2.0 && a.a1[2]==3.0 && A().a1[0] == 1.0 && A().a1[1] == 2.0 && A().a1[2]==3.0 ){
        return 0
    }

    return 1
}
