// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func +(a:A,b:Int8):Int32{
        return 1
    }
}

trait update {
    operator func +(a:A,b:This):Int32
}

append Int8 with update{
    operator func +(a:A,b:Int8):Int32 {return 2}
}


func main():Int64{
    var a = A()
    var b : Int8 = 1
    if (a+b == 1) {
        return 0
    }
    return 1
}
