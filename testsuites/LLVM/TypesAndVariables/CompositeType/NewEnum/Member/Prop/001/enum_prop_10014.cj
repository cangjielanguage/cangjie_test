// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(T,T,T)

    prop let c : Option<T> {
       get() {
            match (this) {
                case a(x,y,z) => Some<T>(x)
                case _ => None<T>
            }
       }
    }
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return match (i.c) {
        case Some(res) => res - 1
        case $None => -1
    }
}
