// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{
    class B{
        operator func +(b:B):Bool{return true}
    }
}


func main():Int64{
    var b = A.B()
    if (b+b) {
        return 0
    }
    return 1
}
