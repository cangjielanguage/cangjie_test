// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{
    var a : Array<T>
    var b : ArrayList<T>
    init(input:T){
        //a = [input].toArray()
        a = @{input}
        b = ArrayList<T>(a)
    }
}

func main(): Int64 {
    return A<Int64>(1).b.size() - 1
}