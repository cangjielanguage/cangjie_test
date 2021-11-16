// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    static func test(input:T){
        var a : List<T> = [input]
        return a.size() - 1
    }
}
class Test<T> <: A<T>{}

func main(): Int64 {
    return Test<Int64>.test(1)
}
