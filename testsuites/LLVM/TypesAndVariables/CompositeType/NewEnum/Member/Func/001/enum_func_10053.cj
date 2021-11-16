// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(T)
    static func foo(){A<Int64>.foo(0)}
    static func foo(x:Int64){x}
}

func main(): Int64 {
    return A<Int64>.foo()
}
