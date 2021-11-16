package pkgs

external record Data<T> {
    let width: T
    let length: T
    Data(width1:T, length1: T){
        width = width1
        length = length1
    }
    func area(): T {
        return width
    }
}
