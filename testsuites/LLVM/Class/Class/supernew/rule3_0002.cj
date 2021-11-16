// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var b :Int32 = 6
    init(){
      this.b = 5
    }

    init(a : Int32){}
	
}

class Test<T> <: Base{
    var a: Int32 = 3
    Test(){
      super(a)
    }

    init(x: Int32){
        this()
    }
}

func main(): Int64 {
    var test2 = Test<Int32>(8)
    if( test2.b == 6 && test2.a == 3
    ){
        return 0
    } 
    return 1
}
