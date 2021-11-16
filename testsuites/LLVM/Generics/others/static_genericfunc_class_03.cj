// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Coo<T> {
   static func foo<V>():Option<V>{
       return Option<V>.None
   }
   static var a:Option<T> = foo<T>()
}

func main(): Int64 {
   var i: Int32 = 3
   var a: Option<String> = Coo<String>.a
   var res = match (a){
       case Some(x) => x
       case None => "No"
   }
   if ( res != "No" ){
       return 1
   }
    return 0
}