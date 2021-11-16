// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T,V> where T<: V<Int32> { // EXPECTED: regex error.*type argument's number does not match type parameter's number
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   return 0
}
