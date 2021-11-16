// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

interface update{
    operator func *(b:Bool):Int32
}

extend Char <: update{
    operator func * (b:Bool):Int32{return 0}
}

extend A <: update{
    operator func * (b:Bool):Int32{return 0}
}

func main():Int32{
    var a = A()
    var b : Char = 'b'
    var c : Bool = true
    return a*c+b*c
}
