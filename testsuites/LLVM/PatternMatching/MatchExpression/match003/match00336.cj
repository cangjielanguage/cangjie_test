// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C1 {
    var a : Int32 = 0
    init(a: Int32){
      this.a = a
    }
}

class C2 <: C1{
    init(){
      super(1)
    }
}


func main(): Int64 {
    return 0
}
