// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    if ( case01() != 0 ) {return 1}
    if ( case02() != 0 ) {return 1}
    return 0
}

func case01(){
    let score = 80
    var result = match (80) {
        case 40 => Int64(0)
        case _ => Int32(1)
    }
    return result
}

func case02(){
    let score = 80
    var result = match (80) {
        case 40 => Float64(0)
        case _ => Int64(1)
    }
    return result
}