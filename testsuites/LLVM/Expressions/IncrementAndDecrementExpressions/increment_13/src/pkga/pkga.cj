package pkga

external var ext = 1

external open class Base {
    protected var a1: Int32 = 0
    protected var a2 :Int32 = 0
    private let b1: Int32 = 0
    private let b2:Int32 = 0
    init(x:Int32){
        a2 = x
    }
}

external class Data <: Base {
    var aa1 :Int32 = 10
    let bb1: Int32 = 10
    var m:Int32 = 1
    static var n:Int32 = 1
    protected var p:Int32 = 1
    init(x:Int32){
        super(x) // Data(1),super.a2 = 1
        this.aa1-- // a1=10-1=9
        this.a2-- // a2=0-1=-1
        super.a1-- // super.a1=0-1=-1
        super.a2--;Data.n--;n-- // a2=0-1=-1 // n = 1-1-1=-1
        m = this.aa1+this.a2+super.a1+super.a2 // 9 + (-1) + (-1) + (-1)) = 6
    }
    func get():Int32{
        this.aa1-- // a1= 9-1=8
        super.a1-- // super.a1=-1-1=-2
        Data.n--;n--;  // n=-1-1-1=-3
        var res = this.aa1+this.a2+super.a1+m +n// 8 + (-1)+ (-2) + 6 + (-3) =8
        return res
    }
}
