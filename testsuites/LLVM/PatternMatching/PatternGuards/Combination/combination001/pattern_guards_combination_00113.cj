// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A{
    a(Int64)
}

func main(){
    var i : A = A.a(1)
    var a : Int64 = match (i) {
        case a(x) if (false) => 2
        case a(x) if (true) => 1
        case _ => 0

    }
    return (a-1)
}