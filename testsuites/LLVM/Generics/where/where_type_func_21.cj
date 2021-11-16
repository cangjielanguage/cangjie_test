// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: ()->Int8, T<:()->Int16 { // EXPECTED: regex error.*generic parameter 'T' cannot have two or more class irrelevant upper bounds
    var a : T
    init(x:T){
        a = x
    }
}

func foo():Int8{
    return 1
}
func goo():Int8{
    return 2
}

func main() {
   var a1 = Aoo<()->Int8>(goo)
   return 0
}
