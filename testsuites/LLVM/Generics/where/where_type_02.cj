// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

class Aoo<T> where T<: Nothing { // EXPECTED: regex error.*undeclared type name 'Nothing'
    var a : T
    init(x:T){
        a = x
    }
}

class Boo<T> where T<: Bottom { // EXPECTED: regex error.*undeclared type name 'Bottom'
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a1 = Aoo<Nothing>(return)
   var a2 = Boo<Bottom>(return)
   return 0
}
