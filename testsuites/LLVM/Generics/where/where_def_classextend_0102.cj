// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Base {
    static var foo = 1
}

class Aoo<T> where T<: Base{}

extend Aoo<T> where T<: Base {
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

