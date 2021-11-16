// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<:(T)->T { // EXPECTED: regex-auto generic parameter 'T' cannot be used in class irrelevant upper bounds '(Generics-T) -> Generics-T'
    var a : T
    init(x:T){
        a = x
    }
}

func foo<T>(x:T):T{
    return x
}

func main() {
   var a = Aoo<(Int64)->Int64>(foo)
   if ( a(1) != 1 ){
       return 1
   }
   return 0
}
