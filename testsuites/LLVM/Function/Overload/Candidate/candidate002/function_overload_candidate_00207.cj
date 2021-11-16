// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var this : Int64 = 1 // EXPECTED: regex-auto 'this' is keyword not identifier, you can use '`this`' instead

func main():Int64{
    var Int8 : Int64 = 1 // EXPECTED: regex-auto 'Int8' is keyword not identifier, you can use '`Int8`' instead
    let func : Int64 = 1 // EXPECTED: regex-auto 'func' is keyword not identifier, you can use '`func`' instead
    return 1
}