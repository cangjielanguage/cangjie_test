// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: Bool & Nothing { // EXPECTED: regex error.*undeclared type name 'Nothing'
    var a : T
    init(x:T){
        a = x
    }
}

class Boo<T> where T<: Bool & Bottom { // EXPECTED: regex error.*undeclared type name 'Bottom'
    var a : T
    init(x:T){
        a = x
    }
}


func main() {
   var a = Aoo<Bool>(false)
   return 0
}
