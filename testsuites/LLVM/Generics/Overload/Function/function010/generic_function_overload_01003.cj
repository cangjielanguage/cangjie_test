// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A<T>{
    static func f (a: Int64): Int64 {0} //f1
    static func f (a: T): Int64 {1} //f2
}

func main(){
    A<Int32>.f(1) // f1
}
