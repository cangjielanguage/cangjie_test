package pkga

external var ext = 1

external open class Base {
    protected var base_a1: Int32 = 0
    protected var a2 :Int32 = 0
    private let b1: Int32 = 0
    private let b2:Int32 = 0
    init(x:Int32){
        a2 = x
    }
}

external class Data <: Base {
    var a1 :Int32 = 10
    let b1: Int32 = 10
    var m:Int32 = 1
    static var n:Int32 = 1
    protected var p:Int32 = 1
    init(x:Int32){
        super(x) // Data(1),super.a2 = 1
        this.a1++
        this.a2++
        super.base_a1++
        super.a2++;Data.n++;n++
        print("this.a1:"+"${a1}"+"\n")
        print("this.a2:"+"${a2}"+"\n")
        print("super.base_a1:"+"${super.base_a1}"+"\n")
        print("super.a2:"+"${super.a2}"+"\n")
        print("n:"+"${n}"+"\n")
        m = this.a1+this.a2+super.base_a1+super.a2 // 11 + 3 + 1 + 3 = 18
    }
    func get():Int32{
        this.a1++
        super.base_a1++
        Data.n++;n++;
        var res = this.a1+this.a2+super.base_a1+m +n// 12 + 3 + 2 + 18 + 5 = 40
        return res
    }
}
