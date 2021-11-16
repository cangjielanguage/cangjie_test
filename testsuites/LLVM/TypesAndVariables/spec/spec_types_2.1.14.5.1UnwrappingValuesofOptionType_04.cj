// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Option<T> { Some(T) | None }

class C {
        var item: Int64 = 100
}


func main(){
    let c = C()
    let c1 = Option<C>.Some(c)
    let c2 = Option<C>.None
    let r1 = c1?.item  // r1 = Option<Int64>.Some(100)
    let r2 = c2?.item  // r2 = Option<Int64>.None 
    return 0
}

