// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    func f(a:Int64,b:Int64): Int64{
        return a + b
        }
    let sum = { f: (Int64, Int64) -> Int64, a: Int64, b: Int64 => f(a, b)}
    return sum(f,0,0)
}

func main(): Int64 {
    return test()
}
