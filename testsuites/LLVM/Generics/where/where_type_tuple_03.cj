// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: Unit*Int32 {
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a1 = Aoo<Unit*Int32>(((),Int64(1))) // EXPECTED: regex error.*parameters and arguments mismatch
   var a2 = Aoo<Unit*Int64>(((),Int64(1))) // EXPECTED: regex error.*generics type arguments do not match the constraint
   var a3 = Aoo<Unit*Int32>(((),Int8(1))) // EXPECTED: regex error.*parameters and arguments mismatch
   return 0
}
