package pkga

external record Data {
    let width: Int64
    let length: Int64
    init(width1:Int64, length1: Int64){
        width = width1
        length = length1
    }
    func area(): Int64 {
        return width
    }
}

