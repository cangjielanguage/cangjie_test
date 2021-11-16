// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func ()(input:Int64):Int64{input}
}



func main(): Int64 {
    var a = A()
    1 |> a
    a~>a
    1 |> (a~>a)

    var f = a~>a
    1 |> f


    return (1 |> a) - 1
}
