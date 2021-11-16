// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum C<T> {
    c
    func test(a:T){a}
}

func bar(x:Int64){1}

func main(): Int64 {
    var x = C<Int64>.c
    let c1 = Option<C<Int64>>.Some(x)
    let r1 = c1?.test
    var res = r1 ?? bar
    return res(0)
}
