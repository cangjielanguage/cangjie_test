package pkgs

open class Base<T> {
    var i: Int32

    Base(){
        this.foo() // EXPECTED : regex 'foo' is not allowed to be accessed before all member variables are initialized
    }

    open func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    var i: Int32
    init(){
        this.foo() // EXPECTED : regex 'foo' is not allowed to be accessed before all member variables are initialized
    }
    init(x: Int32){
        i = x
    }

    override func foo(): Int32{
        return 4
    }
}