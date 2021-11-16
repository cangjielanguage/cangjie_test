// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Int64){
    func b(x:List<Int64>):List<Int64>{
        return x
    }
    return b([input]).size() - 1
}

func main(): Int64 {
    return a(1)
}
