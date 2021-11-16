// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A<T>{
    func f (a: Int64): Int64 {0} //f1
    func f (a: T): Int64 {1} //f2
    func test() {f(1)}
}

func main(){
    A<Int32>().test() // f1
}