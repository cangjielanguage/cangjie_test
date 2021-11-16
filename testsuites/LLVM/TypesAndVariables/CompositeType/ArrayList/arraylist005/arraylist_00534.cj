// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record C<T>{
    C(let c : T) {}
}

func main(): Int64 {
    var res = C<ArrayList<Unit>>(ArrayList<Unit>(10)).c
    return res.size()
}