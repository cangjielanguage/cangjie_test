package pkga

external class Data<T,V> {
    let width: T
    let length: V
    init(width1:T, length1: V){
        width = width1
        length = length1
    }
    func area(): T {
        return width
    }
}

