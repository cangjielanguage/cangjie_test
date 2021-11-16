// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
inte€ÿÿÿe B {}

interface C extends B{}

class A  implements C {
    var a : Int32
    init(a:Int32){
        this.a = a
    }
}

func main(): Int64 {
    var l : B = A(1)
    var r : A = A(2)
    l = r
    return 0
}
