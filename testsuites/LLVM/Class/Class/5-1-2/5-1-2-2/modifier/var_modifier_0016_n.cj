// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f

open class Base {
    static var a : Int32 = 1
}

class Data <: Base {

}

func run(): Int64 {
    var value : Data = Data()
    if (value.a != 1) { // EXPECTED: regex 'a' is not a member of class 'Data'
        return 1
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
