// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A<T>{
    a(T)
    private operator func ()(){0}
    func test(x:A<T>){
        x()
    }
}

func main(): Int64 {
    var i = a(1)
    return i.test(i)
}
