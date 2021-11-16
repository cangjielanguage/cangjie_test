package pkgb
import pkga.*


external func boo():Int64{
    var b0: Int64 = 2
    var b: Data_a<Int64> = Data_a<Int64> (b0,b0)
    if (pkga.a.area() != 1){
        return 1
    }
    if (b.area() != 2){
        return 1
    }
    return 0
}

external record Data_b<T> {
    let width: T
    let length: T
    let b: Data_a<T>
    init(width1:T, length1: T,other:Data_a<T>){
        width = width1
        length = length1
        b = other
    }
    func area(): T {
        return b.area()
    }
}