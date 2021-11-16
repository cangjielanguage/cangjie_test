// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T> {
    static func coo<V>(x:T,y:V):V{
        return y
    }
}
class Test<T> <: I<T>{}

func run(): Int64 {
    var res1  = Test<Int32>.coo<String>(3, "hello");
    if (res1 != "hello") {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
