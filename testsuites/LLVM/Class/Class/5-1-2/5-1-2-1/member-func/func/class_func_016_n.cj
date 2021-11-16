// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex 'get' is not a member of class 'Data'


abstract class Base {
    static func get() : Int32 {
        return 1
    }
}

class Data <: Base {

}

func run(): Int64 {
    var value : Data = Data()
    if (value.get() != 1) {
        return 1
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
