// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    let a : Int64
    public operator func +(inputB:A):Int64{
        return 0
    }
    init(a:Int64){
        this.a = a
    }
}


func main():Int64{
    var a = A(1)
    var b = A(-1)
    return (a+b)
}
