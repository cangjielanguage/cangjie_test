// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C1 {
    let a = 1
}

class C2 <: C1{
    let b : Int64
    init() {
        b = super.a
    }
    func test(){
        var i : Int32 = 0
        match (i) {
          case _ => super.a
       }
    }
}


func main(): Int64 {
    return 0
}
