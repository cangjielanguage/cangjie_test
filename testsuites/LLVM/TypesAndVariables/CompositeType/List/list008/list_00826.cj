// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a<T>(input:T){
    func b(x:List<T>):List<T>{
        return x
    }
    return b([input]).size() - 1
}

func main(): Int64 {
    return a(1)
}
