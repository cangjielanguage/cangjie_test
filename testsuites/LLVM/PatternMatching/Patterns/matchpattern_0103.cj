// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    if ( case01() != 0 ) {return 1}
    return 0
}

func case01(){
    var result: Int64 = match (()) {
        case ()  => 0 // EXPECTED: regex error.*?expected pattern here
        case a => 1
        case _ => 10
    }
    return result
}