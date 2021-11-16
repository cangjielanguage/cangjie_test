// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{
    static func test(input:T){
        let a : List<T> = [input]
        let b : List<Int64> = [1]
        return a.size() + b.size() - 2
    }
}

class Test<T> <: I<T> {}

func main(): Int64 {
    return Test<Int64>.test(1)
}
