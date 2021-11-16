// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var b :Int32 = 6
    init(x: Int32){
      this.b = 5
    }
	
}

class Test<T> <: Base{
    var a: Int32 = 3
    Test(){
      super(a)
      this.a == a
    }

    init(x: Int32){

        super(x)
        this.a = x
    }
}

func main(): Int64 {
    var test = Test<Int32>()
    var test2 = Test<Int32>(8)

    if(test.b == 5 && test.a == 3 && test2.a == 8 && test2.b == 5

    ){
        return 0
    } 
    return 1
}
