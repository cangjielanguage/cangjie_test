// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
trait A<T>{
    func test(a:This,b:ArrayList<T>):This
}

func main(): Int64 {
    return 0
}