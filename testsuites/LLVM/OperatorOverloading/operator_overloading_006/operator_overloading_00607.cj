// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{}

interface update<T>{
    operator func *(b:T):Int32
}

extend Char <: update<Char>{
    operator func * (b:Char):Int32{return 0}
}

extend A <: update<A>{
    operator func * (b:A):Int32{return 0}
}

func main():Int64{
    var a = A()
    var b : Char = 'b'
    var c : Int32 = 1
    return Int64(a*a+b*b)
}
