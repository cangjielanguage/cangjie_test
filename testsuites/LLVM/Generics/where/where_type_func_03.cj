// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: ()->Int32 {
    var a : T
    init(x:T){
        a = x
    }
}

func foo():Int64{
    return 1
}
func goo():Int8{
    return 1
}

func main() {
   var a1 = Aoo<()->Int32>(foo) // EXPECTED: regex error.*parameters and arguments mismatch
   var a2 = Aoo<()->Int64>(foo) // EXPECTED: regex error.*generics type arguments do not match the constraint
   var a3 = Aoo<()->Int32>(goo) // EXPECTED: regex error.*parameters and arguments mismatch
   return 0
}
