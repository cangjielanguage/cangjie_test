// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum E{|e}

class A{
    var e : Int64 = 1
    static func test(){var a = e} // EXPECTED: regex 'e' is non-static member, cannot be accessed by static function 'test'
}


func main(): Int64 {
    A.test()
    return 0
}
