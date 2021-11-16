package pkga

external record Data_a<T> {
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
external var a: Data_a<Int64> = Data_a<Int64>(a0,a0)

