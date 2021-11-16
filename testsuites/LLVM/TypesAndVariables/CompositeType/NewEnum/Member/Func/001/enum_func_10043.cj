// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A<T>{
    a(T)
    private operator func ()(x:T) {0}
    func foo(){0}
    func test(){
        foo()
    }
}

func main(): Int64 {
    return A.a(1).test()
}
