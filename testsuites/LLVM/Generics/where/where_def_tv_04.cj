// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T,V> where T<: V & String,V<:Int32 { // EXPECTED: regex error.*generic parameter 'T' cannot have two or more class irrelevant upper bounds
    var a : V
    init(x:V){
        a = x
    }
}

func main() {
   var a = Aoo<String,Int32>(1)
   return 0
}
