package pkga

external func Data<T>(x:T):T {
    let width: T = x
    return width
}

external func Data(x:Int64):Int64 {
    let width: Int64 = x
    return width*2
}