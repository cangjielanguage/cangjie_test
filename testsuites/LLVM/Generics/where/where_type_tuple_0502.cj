// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: Unit*A {
    var a : T
    init(x:T){
        a = x
    }
}

open class A {
    var a = 1
}
class B <: A {
    var b = 2
}

func main() {
   var a4 = Aoo<Unit*B>(((),A())) // EXPECTED: regex error.*parameters and arguments mismatch
   return 0
}
