// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum B<T>{a(Bool)}

enum A<T>{a(T)}

func main():Int64{
    var i = a<Int64>(1) // A<Int64>.a<Int64>(1)
    var j = a<Int64>(true)  // B<Int64>.a<Int64>(true)
    return 0
}
