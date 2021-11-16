// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{}

func test<T>(x:T){
    var a : ?A<T> = A<T>()
    match (a) {
        case _ : Option<A<T>> => 0
        case _ => 1
    }
}


func main(): Int64 {
    return test(true)
}
