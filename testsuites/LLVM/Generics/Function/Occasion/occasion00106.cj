// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    func f<T>(a:T){}
}

func main(){
    var a :Int32 = 0
    A().f<Int32>(a)
    //A.f<Int32>(a)
    return 0
}