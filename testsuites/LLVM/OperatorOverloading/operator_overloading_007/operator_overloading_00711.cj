// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{
    interface B{
        operator func +(b:B):Bool{return true}
    }
    class C <: B{}
}


func main():Int64{
    var b : A.B = A.C()
    if (b+b) {
        return 0
    }
    return 1
}
