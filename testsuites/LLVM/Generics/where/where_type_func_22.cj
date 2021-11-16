// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: (Int32)->Int8 & (Int64)->Int16 { // EXPECTED: regex error.*generic parameter 'T' cannot have two or more class irrelevant upper bounds
    var a : T
    init(x:T){
        a = x
    }
}

func foo(x:Int32):Int8{
    return 1
}
func goo(x:Int64):Int8{
    return 2
}

func main() {
   var a1 = Aoo<(Int64)->Int8>(goo)
   return 0
}
