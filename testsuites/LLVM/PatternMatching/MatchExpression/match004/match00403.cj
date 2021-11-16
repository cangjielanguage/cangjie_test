// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(): Int64 {
    var i : Int32 = 0
    var res : Char = match (i) {  // EXPECTED: regex initializer's type is incompatible with variable declaration 'res'
        case 0 => 1
        case _ => -1
    }
    if (res == 0) {  // EXPECTED: regex invalid binary operator '==' on type 'Char' and 'Int'
        return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}
