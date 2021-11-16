// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

class Data<T>{
    func f(x: T): T{
        return x
    }
}
func run(): Int64 {
    let data: Data<Int32> = Data<Int32>()
    let str: Int32 = data.f("String") // EXPECTED: regex no matching function declaration for function call
    return 0
}

