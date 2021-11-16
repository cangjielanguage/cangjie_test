package pkga

external record Data {
    let width: Int32
    let length: Int32
    init(width1:Int32, length1: Int32){
        width = length1
        length = width1
    }
    func area(): Int32 {
        return width
    }
}
