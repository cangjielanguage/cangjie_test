// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
    operator func ()(input:T):T{input}
}



func main(): Int64 {
    var a = A<Int64>()
    1 |> a
    a~>a
    1 |> (a~>a)

    var f = a~>a
    1 |> f


    return (1 |> a) - 1
}
