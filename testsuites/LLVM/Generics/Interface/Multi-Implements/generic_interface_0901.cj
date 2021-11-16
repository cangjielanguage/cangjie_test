// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    if ( B().a != 1 ){
        return 1
    }
    return 0
}

open class A1 {
    func foo(){
        return 1
    }
}
interface A2 {
    func foo(){
        return 2
    }
}

class B <: A2 & A1 { // EXPECTED: regex error.*?super class 'A1' must be placed at the beginning of supertype list
    prop let m:Int64{
        get(){
            return foo()
        }
    }
}


