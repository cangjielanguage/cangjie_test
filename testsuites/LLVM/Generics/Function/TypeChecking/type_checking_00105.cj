// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

func g<T>(a:T){
    func assert(a:Int32):Int32{return 1}
    return 0
}

func main(){
    return 0
}