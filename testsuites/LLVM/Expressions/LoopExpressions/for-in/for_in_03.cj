// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    if ( case01() != 4 ) {
        return 1
    }
    return 0
}

func case01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    let a: Int32 = 0
    for (item in intList) if ( item > 3 ) {
        a = item // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant 
    }
    a
}




