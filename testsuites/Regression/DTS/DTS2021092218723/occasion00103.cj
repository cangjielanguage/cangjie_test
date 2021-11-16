// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func g<T1>(a:T1){
    func f<T2>(b:T2){}
    var a :Int32 = 0
    f<Int32>(a)
}
func main(){
    var a :Int32 = 0
    g<Int32>(a)
    return 0
}