// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
trait A{
    func test(a:This):This
}

record R<T>{}

append<T> R<T> with A{
    func test(a:R<T>):R<T>{
        func x(input:ArrayList<T>){}
        return a
    }
}

func main(): Int64 {
    return 0
}