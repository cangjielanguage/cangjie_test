// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
var varChar1 : Char = '\u{0}'
var varChar2 : Char = '\u{99999999}' // EXPECTED: regex invalid unicode scalar
var varChar3 : Char = '\u{ffffffff}' // EXPECTED: regex invalid unicode scalar
var varChar4 : Char = '\u{12345678}'
var varChar5 : Char = '\u{ABCDEF01}' // EXPECTED: regex invalid unicode scalar
var varChar6 : Char = '\u{01abcdef}'

let letChar1 : Char = '\u{0}'
let letChar2 : Char = '\u{99999999}' // EXPECTED: regex invalid unicode scalar
let letChar3 : Char = '\u{ffffffff}' // EXPECTED: regex invalid unicode scalar
let letChar4 : Char = '\u{12345678}'
let letChar5 : Char = '\u{ABCDEF01}' // EXPECTED: regex invalid unicode scalar
let letChar6 : Char = '\u{01abcdef}'
return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
