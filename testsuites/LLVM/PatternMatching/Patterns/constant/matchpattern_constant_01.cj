// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    if (case01() != 0) {return 1}
    return 0
}

func case01(){
    let score = 80
    var a = 80
    var result: Int64 = match (80) {
        case $a => 0 // EXPECTED: regex-auto 'a' as 'const pattern' should be read only variable
        case _ => 1
    }
    return result
}