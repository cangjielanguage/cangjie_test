// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{
    operator func *(b:A<T>):Bool  {
    var res1 = @{true}[0]
    var res2 = (true,false)[0]
    var res3 = {  => true}
    var res4 = res1&&res2&&res3()
    return res4
    }
}



func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    if (!(b*a)) {
        return 1
    }
    return 0
}
