// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    return run()
}

class Data<T>{
    let width: T = 1 // EXPECTED: regex initializer's type is incompatible with variable declaration 'width'
    let length: T = 2 // EXPECTED: regex initializer's type is incompatible with variable declaration 'length'
    init(widthin:T, lengthin: T){
        width = widthin
        length = lengthin
    }
}
func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data = Data<Int32>(a, b)
    return 0
}


}
