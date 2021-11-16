// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Aoo<T> where T<: (Int32) {
    var a : T
    init(x:T){
        a = x
    }
}

class Boo<T> where T<: (Char) {
    var a : T
    init(x:T){
        a = x
    }
}

class Coo<T> where T<: (Bool) {
    var a : T
    init(x:T){
        a = x
    }
}

class Doo<T> where T<: (Unit) {
    var a : T
    init(x:T){
        a = x
    }
}

func main() {
   var a1 = Aoo<(Int32)>(1)
   if ( a1.a != 1 ){
       return 1
   }
   var a2 = Boo<(Char)>('a')
   if ( a2.a != 'a' ){
       return 2
   }
   var a3 = Coo<(Bool)>(false)
   if ( a3.a  ){
       return 3
   }
   var a4 = Doo<(Unit)>(())
   if ( a4.a != () ){
       return 4
   }
   return 0
}
