// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Coo<T> {
   static var a:Option<T> = Option<T>.None
   static func foo<V>(x: V):Option<T>{
       return a
   }
}

func main(): Int64 {
    var i: Int32 = 3
    var a: Option<String> = Coo<String>.foo<Int32>(i)
    var res = match (a){
        case Some(x) => x
        case None => "No"
    }
    if ( res != "No" ){
        return 1
    }
    return 0
}