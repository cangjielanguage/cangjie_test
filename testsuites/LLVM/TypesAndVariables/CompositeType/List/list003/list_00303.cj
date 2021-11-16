// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record C<T>{
    var a : List<T>
    var b : List<Int64>
    init(input:T){
        a = [input]
        b = [1]
    }
}


func main(): Int64 {
    var c = C<Int64>(1)
    return c.a.size() + c.b.size() - 2
}
