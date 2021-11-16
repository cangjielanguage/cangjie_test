// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A{
    a(Bool)
}

func main(){
    var i : A = A.a(true)
    var a : Int64 = match (i) {
        case a(x) if (!x) => 2
        case a(x) if (x) => 1
        case _ => 0
    }
    return (a-1)
}