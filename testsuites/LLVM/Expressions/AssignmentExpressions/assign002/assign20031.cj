// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface C {}

class A  <: C {
    var a : Int32
    init(a:Int32){
        this.a = a
    }
}

func main(): Int64 {
    var l : C = A(1)
    var r : A = A(2)
    l = r
    return 0
}
