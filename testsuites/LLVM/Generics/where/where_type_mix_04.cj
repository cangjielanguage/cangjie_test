// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: String & Object { // EXPECTED: regex error.*generic parameter 'T' cannot have class irrelevant upper bounds 'Record-String' and class upper bounds 'Class-Object' at the same time
    var a: T
    init(x:T){
        a = x
    }
}

func main() {
   var a = Aoo<String>("a")
   return 0
}
