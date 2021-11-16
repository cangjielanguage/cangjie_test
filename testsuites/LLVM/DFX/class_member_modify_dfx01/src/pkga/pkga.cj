package pkga

internal open class Base {
    protected let width: Int32 = 0
    protected let length :Int32 = 0
    private let color: Int32 = 0
    private let age:Int32 = 0
    init(x:Int32){
        width = x
    }
}

external class Data <: Base {
    let length :Int32 = 10
    let color: Int32 = 10
    let a:Int32 = width + super.width +  super.length + length // 0+0+0+10
    var b:Int32 = 1
     init(x:Int32){
        super(x) // Data(1),super.width = 1
        width = x*2 // this.width = 2
        length = color + length + super.length + width + super.width // 10+10+0+2+2
    }
    func get():Int32{
        print("super.width:"+super.width.toString()+"\n")
        print("this.width:"+width.toString()+"\n")
        print("this.width:"+this.width.toString()+"\n")
        return length + color + width + a // 24 + 10 + 2 + 10
    }
}
