// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    A(let a : Int64) {}
    operator func + (inputB:A):A{
        var output = A(this.a + inputB.a)
        return output
    }
}


func main():Int64{
    var a = A(1)
    var b = A(-1)
    return (a+b).a
}
