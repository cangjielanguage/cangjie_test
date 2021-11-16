// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Base {
    static var foo = 1
}

class Aoo<T> where T<: Base{}

extend Aoo<T> { // EXPECTED: regex generics type arguments do not match the constraint
    func foo(x:T){
        var f = T.foo
        return f
    }
}

func main() {
   let obj = Base();
   var a = Aoo<Base>()
   if ( a.foo(obj) != 1 ){
       return 1
   }
   return 0
}

