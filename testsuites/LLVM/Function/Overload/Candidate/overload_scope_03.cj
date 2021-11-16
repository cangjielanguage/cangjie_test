// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {

    return 0
}

open class A {
    var a:Int32
    init(x:Int32){ a = x + 1 }
    func foo1(x:Int64):Int64{
        return Int64(1)
    }
}

class B <: A {
    var b:Int32
    init(x:Int32){
        super(x)
        b = x
    }
    func foo1(x:Int32):Int32{
        return Int32(2)
    }
    func goo(){
        this.foo1(1)
        super.foo1(1)
        foo1(1)
    }

}
