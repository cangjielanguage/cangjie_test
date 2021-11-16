// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Base3  {
    func foo (): Int64
}


interface Data  {
    func foo (a: Int32) : Int64{ // EXPECTED: regex function 'foo' has overload conflicts
        return 1
    }

    func foo (a: Int32) :Bool { // EXPECTED: regex function 'foo' has overload conflicts
        return a
    }

}

class Test <: Base3 & Data{  // EXPECTED: regex class 'Test' missing abstract modifier or abstract function 'foo' should be implemented
    
}

func main(): Int64 {

    return 0
}