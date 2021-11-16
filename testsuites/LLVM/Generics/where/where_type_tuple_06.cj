// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: Unit*A {
    var a : T
    init(x:T){
        a = x
    }
}

class A  <: B {
    var a = 1
}
open class B {
    var b = 2
}

func main() {
   var a1 = Aoo<Unit*A>(((),Boo())) // EXPECTED: regex error.*parameters and arguments mismatch
   var a2 = Aoo<Unit*B>(((),Boo())) // EXPECTED: regex error.*generics type arguments do not match the constraint
   var a3 = Aoo<Unit*A>(((),Aoo())) // normal
   var a4 = Aoo<Unit*B>(((),Aoo())) // EXPECTED: regex error.*generics type arguments do not match the constraint
   return 0
}
