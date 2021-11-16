// EXEC-PIPE-1: %compiler %cmp_opt -c %f 2>&1 | compare %f

var res1 = "a" != 'a'       // EXPECTED: regex invalid binary operator '!=' on type 'Record-String' and 'Char'
var res2 = "1" != 1         // EXPECTED: regex invalid binary operator '!=' on type 'Record-String' and 'Int'
var res3 = "1.2" != 1.2     // EXPECTED: regex invalid binary operator '!=' on type 'Record-String' and 'Float'
var res4 = "true" != true   // EXPECTED: regex invalid binary operator '!=' on type 'Record-String' and 'Bool'
var res5 = "false" != false // EXPECTED: regex invalid binary operator '!=' on type 'Record-String' and 'Bool'
var res6 = "()" != ()       // EXPECTED: regex invalid binary operator '!=' on type 'Record-String' and 'Unit'
