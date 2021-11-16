// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
    operator func *(b:A<T>):Bool  {
    var i = match (this) {
    case _ : A<T> => true
    case _ => false
}
var j = match (b) {
    case _ : A<T> => true
    case _ => false
}
    return i&&j
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
