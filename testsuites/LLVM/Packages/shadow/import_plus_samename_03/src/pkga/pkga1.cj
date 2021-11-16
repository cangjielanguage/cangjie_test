package pkga

external func Data<T,V>(x:T,y:V):T {
    let width: T = x
    let length: V = y
    return width
}

external func Data(x:Int64,y:String):Int64 {
    let width: Int64 = x
    let length: String = y
    return width*2
}
