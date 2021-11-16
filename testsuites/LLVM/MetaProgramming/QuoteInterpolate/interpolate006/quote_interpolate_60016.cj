// ERRCHECK: %compiler %cmp_opt %f %append_pic_opt

package define

import append_60016.*
from ast import ast.*

external macro test(input:Tokens):Tokens{
    var a = { input:Int64 => input}
    var x = quote($a)     // EXPECTED: regex undeclared identifier 'toTokens'
    var y = quote($a)         // EXPECTED: regex undeclared identifier 'toTokens'
    if (x.size() != 1) {
        return quote(1)
    }
    if (y.size() != 2) {
        return quote(2)
    }
    return x
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace