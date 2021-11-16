// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T>{
    var c : T
    init(input:T){
        c = input
    }
}

func main(): Int64 {
    var res = C<ArrayList<Unit>>(ArrayList<Unit>(10)).c
    return res.size()
}