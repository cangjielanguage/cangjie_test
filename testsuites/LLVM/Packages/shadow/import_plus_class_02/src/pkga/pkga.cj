package pkga

external open class Base {
    protected var width: Int32 = 0
    protected var length :Int32 = 0
    private var color: Int32 = 0
    private var age:Int32 = 0
    init(x:Int32){
        width = x
    }
}

external class Data <: Base {
    var length1 :Int32 = 10
    var color: Int32 = 10
    var a:Int32
     init(x:Int32){
        super(x)
        a = width + super.width +  super.length + length1
        width = x*2
        length1 = color + length1 + super.length + width + super.width // 10+10+0+2+2
    }
    func get():Int32{
        return length1 + color + width + a // 24 + 10 + 2 + 2
    }
}
