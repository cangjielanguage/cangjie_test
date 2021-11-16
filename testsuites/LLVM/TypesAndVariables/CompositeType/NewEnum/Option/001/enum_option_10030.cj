// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{}

func test<T>(x:T){
    var a : ?A<Int64> = A<Int64>()
    match (a) {
        case _ : Option<A<Int64>> => 0
        case _ => 1
    }
}


func main(): Int64 {
    return test(true)
}
