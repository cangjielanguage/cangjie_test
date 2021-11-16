// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    case01(1,2)
    case02()
    return 0
}

// for中的pattern加括号，编译报错
func case01(a: Int32, b: Int32){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    for ((item) in intList) if ( item > 3 ) { // EXPECTED: regex error.*?tuple need more than one field
        item
    }
}

func case02(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 3
    var res = match (a) {
        case (b) => 0 // EXPECTED: regex error.*?selector isn't a tuple to match tuple pattern
        case _ => 1
    }
    res
}


