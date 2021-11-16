// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

interface update{
    operator func *(b:Int32):Int32
}

extend Int8 <: update{
    operator func * (b:Int32):Int32{return 0}
}

extend A <: update{
    operator func * (b:Int32):Int32{return 0}
}

func main():Int64{
    var a = A()
    var b : Int8 = 1
    var c : Int32 = 1
    return Int64(a*c+b*c)
}
