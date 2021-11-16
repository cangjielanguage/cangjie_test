// EXEC-PIPE-1: %compiler %cmp_opt -c %f 2>&1 | compare %f

class Data { // EXPECTED: regex note.* to match this '{'
    var data: Int32 = 128  // EXPECTED: regex error.* expected '}'
