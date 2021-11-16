// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<:T*Int32 { // EXPECTED: regex error.*generic parameter 'T' cannot be used in class irrelevant upper bounds 'Tuple<Generics-T, Int32>'
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a = Aoo<(Int64*Int32)->Int64>((1,1))
   if ( a[1] != 1 ){
       return 1
   }
   return 0
}
