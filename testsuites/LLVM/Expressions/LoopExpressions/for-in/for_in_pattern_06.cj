// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64 {
    if ( case01() != 5 ) {
        return 1
    }
    return 0
}

func case01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    let b: Int32 = 2
    for (in [0,1,2] in intList) { // EXPECTED: regex error.*?missing 'keyword in' in 'for-in'!
        a++
    }
    a
}
