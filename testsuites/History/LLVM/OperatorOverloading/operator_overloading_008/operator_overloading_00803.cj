// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func +(a:A,b:Int8):Int32{return 1}
    operator func !(a:A):Int32{return 1}
}

trait update {
    operator func +(a:This,b:Int8):Int32
}

append A with update{
    operator func +(a:A,b:Int8):Int32 {return 3}
}

trait update2{
    operator func !(a:This):Int32
}

append A with update2{
    operator func !(a:A):Int32{return 3}
}


func main():Int64{
    var a = A()
    var b : Int8 = 1
    if (a+b!= 1) {
        return 1
    }
    if (!a != 1){
        return 2
    }
    return 0
}
