// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign var a = 1
foreign let b = 1

foreign {
var c = 1
let d = 1
}

var a = 2 // EXPECTED: regex redefinition of declaration 'a'
var b = 2 // EXPECTED: regex redefinition of declaration 'b'
var c = 2 // EXPECTED: regex redefinition of declaration 'c'
var d = 2 // EXPECTED: regex redefinition of declaration 'd'
