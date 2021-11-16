// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: Int32 & Int64 { // EXPECTED: regex error.*generic parameter 'T' cannot have two or more class irrelevant upper bounds 'Int32, Int64'
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a = Aoo<Int32>(1)
   return 0
}
