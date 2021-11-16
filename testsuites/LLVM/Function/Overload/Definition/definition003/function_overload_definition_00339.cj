// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Father{
    func foo(a:Int8):Int64
    
}

class Child <: Father{  // EXPECTED: regex class 'Child' missing abstract modifier or abstract function 'foo' should be implemented
    private func foo(a:Int16):Int64{return 2}
}

func main(){
    return 0
}
