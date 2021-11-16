package pkgb
import pkga.*

external record Data<T> {
    let width: T
    let length: T
    init(width1:T, length1: T){
        width = width1
        length = length1
    }
    func area(): T {
        return width
    }
}

var a0: Int64 = 1
external var a: Data<Int64> = Data<Int64>(a0,a0)

external func aoo():Int64{
    var b0: Int64 = 2
    var b: Data<Int64> = Data<Int64> (b0,b0)
    if (a.area() != 1){
        return 1
    }
    if (b.area() != 2){
        return 1
    }
    return 0
}