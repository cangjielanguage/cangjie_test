package pkga

external class Data {
    let width: Int32
    let length: Int32
    init(width1:Int32, length1: Int32){
        width = width1
        length = length1
    }
    func area(): Int32 {
        return width
    }
}
