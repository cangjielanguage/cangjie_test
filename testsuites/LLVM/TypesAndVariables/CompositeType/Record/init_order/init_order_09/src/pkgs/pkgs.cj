package pkgs

var c:Float32 = 0.0

external record Data {
    var a : Int32  = 100
    var b : Float32 = 200.0
    private init()  {
        a = 200
        b = 300.0
    }

    init(a: Int32 , b!:Float32 = {c = 10.0; c}())  {
        this()
        if ((this.a == 200) && (this.b == 300.0)){
            this.a = a
            this.b = b
        }
    }
}