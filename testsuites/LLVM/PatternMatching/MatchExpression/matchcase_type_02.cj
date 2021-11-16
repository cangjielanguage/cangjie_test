// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 1 ) {
        return 1
    }
    return 0
}

func case01(){
    let score = 80
    let a = {70}
    let b = {}
    var c: A = match ({}) {
        case a => A()
        case _ => B()
    }
    return c.a
}

open class A {
    var a:Int32 = 1
}

class B <: A {
    var b:Int32 = 2
}
