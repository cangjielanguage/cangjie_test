package pkgs

external record Data {
    var width: Int32 = 1
    var length: Int32 =2
    Data(width1:Int32, length1: Int32){
        width = width1
        length = length1
    }
    func area(): Int32 {
        return width*length
    }
}
