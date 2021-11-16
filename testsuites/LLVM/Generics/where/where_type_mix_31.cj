// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: String & ()->String { // EXPECTED: regex-auto generic parameter 'T' cannot have two or more class irrelevant upper bounds 
    var a: T
    init(x:T){
        a = x
    }
}

func foo():String{return "a"}

func main() {
   var a = Aoo<String>("a")
   return 0
}
