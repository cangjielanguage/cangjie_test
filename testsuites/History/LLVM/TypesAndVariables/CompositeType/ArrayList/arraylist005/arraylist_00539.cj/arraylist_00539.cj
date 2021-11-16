// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{
    func test(a:This):This
}

class C<T>{
    var c : T
    init(input:T){
        c = input
    }
}

append<T> C<T> with X{
    func test(a:C<T>){a}
}

func main(): Int64 {
    var res = test(C<ArrayList<Unit>>(ArrayList<Unit>(10)))
    return res.c.size()
}