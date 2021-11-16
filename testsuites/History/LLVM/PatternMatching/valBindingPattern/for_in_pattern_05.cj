// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    if ( case01() != 2 ) {
        return 1
    }
    if ( case02() != 2 ) {
        return 1
    }
    return 0
}

func case01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    let b: Int32 = 2
    for ($b in intList) { // EXPECTED: regex error.*?the pattern in for-in expression must be irrefutable
        a = b
    }
    a
}

func case02(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    let b: Int32 = 2
    for (item@$b in intList) { // EXPECTED: regex error.*?the pattern in for-in expression must be irrefutable
        a = item
    }
    a
}
