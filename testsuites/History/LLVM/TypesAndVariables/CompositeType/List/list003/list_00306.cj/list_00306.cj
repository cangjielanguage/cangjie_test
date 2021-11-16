// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update<T>{
    func test(a:This,b:List<T>):Int64
}

append<T> Int64 with update<T>{
    func test(a:Int64,b:List<T>):Int64{
        return b.size() - a
    }
}

func main(): Int64 {
    var a : Int64 = 1
    var b = [1]
    return test(a,b)
}
