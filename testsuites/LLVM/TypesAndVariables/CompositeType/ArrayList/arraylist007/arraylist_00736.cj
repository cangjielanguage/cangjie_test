// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    func test(input:T){
        //var a : Array<T> = [input].toArray()
        var a : Array<T> = @{input}
        var b : ArrayList<T> = ArrayList<T>(a)
        return b
    }
}

class C <: A<Int64>{}

func main(): Int64 {
    return C().test(1).size() - 1
}