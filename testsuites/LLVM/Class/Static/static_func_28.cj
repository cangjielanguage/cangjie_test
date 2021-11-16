// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    static func coo<V>(x:T,y:V):V{
        return y
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var res1: String  = Data<Int32>.coo<String>(a, "hello");
    if (res1 != "hello") {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
