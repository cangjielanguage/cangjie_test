// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Coo<T> {
   static var a:Option<T> = Option<T>.None
   static prop var foo :Option<T>{
       get() {
           return a
       }
       set(v){
           a = v
       }

   }
}

func main(): Int64 {
    var a: Option<String> = Coo<String>.foo
    var resa = match (a){
        case Some(x) => x
        case None => "No"
    }
    if ( resa != "No" ){
        return 1
    }
    Coo<String>.foo = Option<String>.Some("a")
    var b: Option<String> = Coo<String>.foo
     var resb = match (b){
         case Some(x) => x
         case None => "No"
     }
     if ( resb != "a" ){
         return 2
     }
    return 0
}