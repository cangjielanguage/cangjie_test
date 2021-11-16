// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

//check ther are two more return key word
open class A { }
class B <: A { }

func a(flag: Bool) { 
    if (flag) {
        return A()
    }
    return B()
}

func main(): Int64 {
    let flag : Bool = false
    var x = a(flag)
    var typecheck: Int64 = match(x){
        case _: A => 0
        case _ => 1
    }
    return typecheck
}