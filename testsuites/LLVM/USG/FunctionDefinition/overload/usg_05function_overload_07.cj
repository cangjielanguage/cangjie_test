// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output  2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class C {
    static func f2(a: Int64): Unit {} // EXPECTED:regex error.*?static and non-static function 'f2' cannot be overloaded

    func f2(a: Float64): Unit {} 
}

func main() {
    var f: (Int64)->Unit
    var f: (Float64)->Unit //  EXPECTED:regex error.*?redefinition of declaration 'f'

    var f1: (Int64)->Unit
    func f1(a: Float64): Unit {} // EXPECTED:regex error.*?redefinition of declaration 'f1'

    return 0
}
