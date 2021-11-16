// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func a<T>(input:T):T{input}

func b<T>(input:T):T{input}

class C<T>{
    var a : T
    init(input:T){
        a = input
    }
    operator func ()(input:(T)->T):T{input(a)}

}

func main(): Int64 {
    var c = C(1)


    1 |> a
    a<Int64>~>b<Int64>
    1 |> (a<Int64>~>b<Int64>)

    c(a<Int64>)
    c(a<Int64>~>b<Int64>)
    return ((a<Int64> ~> b<Int64>) |> c) - 1
}
