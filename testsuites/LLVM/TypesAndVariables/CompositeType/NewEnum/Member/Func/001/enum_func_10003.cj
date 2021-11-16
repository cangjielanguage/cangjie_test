// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a
    func b(x:T){0}
}


func main(): Int64 {
    var i = A<Int64>.a
    i.b(1)

}
