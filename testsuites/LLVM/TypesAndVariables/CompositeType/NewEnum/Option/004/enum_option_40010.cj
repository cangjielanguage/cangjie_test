// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T> {
    func test(a:T){a}
}

func bar(x:Int64){1}

func main(): Int64 {
    var c = C<Int64>()
    let c1 = Option<C<Int64>>.None
    let r1 = c1?.test
    let res = r1 ?? bar
    return res(0) - 1
}
