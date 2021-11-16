// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    var a = {  =>
            func f<T>(a:T){}
            f<Int64>(1)
        }
    a()
    return 0
}