// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    operator func [](index: Int64, value: Int64): Unit{
        this.b = value
    }
}

class B{
    var b = 3
}


func main(): Int64{
    var a = A(2)
    return 0
}