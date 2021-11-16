// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var lit01 = b_0001_1000_        // EXPECTED: regex undeclared identifier 'b_0001_1000_'
    let lit02 = 2o30                // EXPECTED: regex expected newline or ';' between expression or declaration
    let lit03 = _0b0_001_1000        // EXPECTED: regex expected expression here
    let lit04 = 0C18        // EXPECTED: regex expected newline or ';' between expression or declaration
    let lit05 = 0x_18   // EXPECTED: regex illegal underline in number literal
    var lit06 = -_0     // EXPECTED: regex redundant operator
    if (lit01 == 24 && lit02 == 1 && lit03 == 1 && lit04 == -1 && lit05 == 0) {
        return 0
    }
    return 1
}