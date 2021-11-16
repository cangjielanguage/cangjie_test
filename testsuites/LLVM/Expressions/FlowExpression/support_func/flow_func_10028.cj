// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func ()(input:Int64):Int32{Int32(input)}
    operator func ()(input:(Int64)->Int64):Int64{input(1)}
}

class B{
    operator func ()(input:Int32):Int64{Int64(input)}
    operator func ()(input:(Int64)->Int64):Int64{input(1)}
}


func main(): Int64 {
    var a = A()
    var b = B()
    1 |> a
    a~>b
    1 |> (a~>b)
    a(a~>b)
    return 0
}
