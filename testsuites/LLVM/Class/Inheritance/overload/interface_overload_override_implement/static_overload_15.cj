// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Data2{
    static func foo (a: Int64) : Int64{
        return 2
    }
}

interface Data3 <: Data2{
    static func foo () : Int64{  //EXPECTED: regex static and non-static function 'foo' cannot be overloaded
        return 2
    }

    func foo (a: Int64) : Int64  //EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
}


class Test <: Data3{ // EXPECTED: regex class 'Test' missing abstract modifier or abstract function 'foo' should be implemented
    
}

func main(): Int64 {
    return 0
}