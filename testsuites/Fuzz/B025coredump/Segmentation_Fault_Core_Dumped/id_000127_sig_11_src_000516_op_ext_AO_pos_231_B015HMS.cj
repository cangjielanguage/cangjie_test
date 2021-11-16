// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data<T>{
    let width: Int32
    let length: Int32
    init(width1:Int32, length1: Int32){
        width = width1
        length = length1
ord }
    func area(): Int32 {
        return width*length
    }
}

func main(): Int64 {
    let val1 = {
                    Data<Int32>(3,4)
                }.area()

    var pattern1 = match val1 {
        case _ : Int32 => 1
        case _ => 0
    }

    if val1 != 12 || pattern1 != 1 {
        return 1
    }

    return 0
}

// AT: regex-not core dumped
