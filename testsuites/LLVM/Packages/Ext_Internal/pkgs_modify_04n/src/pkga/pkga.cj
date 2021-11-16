package pkga

external let one : Int32 = 1
external let two : Int32 = 2
external let t : Data = Test()
func Test():Data{
    let a: Int32 = one
    let b: Int32= two
    return Data(a,b)
}

external class Data{
    var a:Int32
    init(x:Int32,y:Int32){
    this.a = x+y
    }
}

