// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  undeclared identifier 'b'


class Data {

    init()  {
        a = 200
        b = 300.0
    }
    var a : Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
