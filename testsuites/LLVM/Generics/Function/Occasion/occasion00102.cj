// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(){
    func g<T>(a:T){}
    var a :Int32 = 0
    g<Int32>(a)
}

func main(){
    test()
    return 0
}