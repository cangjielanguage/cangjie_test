// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-auto class 'Data' missing abstract modifier or abstract function 'get' should be implemented


abstract class Base {
    func get() : Int32
}

class Data <: Base {

}

func run(): Int64 {
    var value1 : Data = Data()
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
