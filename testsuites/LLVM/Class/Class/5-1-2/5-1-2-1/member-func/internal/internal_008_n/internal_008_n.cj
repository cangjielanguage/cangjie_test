// DEPENDENCE: pkg1.cj
// EXEC: %compiler %cmp_opt pkg1.cj %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex function 'get' can not be abstract


package pkg1

class Data <: Base {
    func get() : Int32 {
        return 1
    }
}

func run(): Int64 {
    var data : Data = Data()
    if (data.get() != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
