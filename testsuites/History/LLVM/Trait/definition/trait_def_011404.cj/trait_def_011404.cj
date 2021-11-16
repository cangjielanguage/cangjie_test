// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait Num1 {
    func plus(a: This, b: Int32): This
}

trait Num2 {
    func plus(a: This, b: Int32): This
}

append Int32 with Num1{
    func plus(a:Int32,b:Int32):Int32{
        return a+1
    }
}


func plus<T>(a:T,b:Int32):T{
    return a
}
func plus(a:Int32):Int32{
    return a
}

func main():Int64{
    var a0:Int32 = 1
    var a:Int32 = plus(a0,a0) // call TraitFunc
    var b:Int32 = plus<Int32>(a0,a0)  // call TraitFunc
    if (a != 2) {
        return 1
    }
    if (b != 2) {
        return 1
    }
    return 0
}
