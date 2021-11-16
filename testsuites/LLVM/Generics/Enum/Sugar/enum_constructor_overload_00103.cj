// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A<T>{
    a |
    a(T)|
    a(T,T)
}

func main():Int64{
    var j = A.a(1)
    var k = A.a(1,1)
    return 0
}
