// EXEC: %compiler %cmp_opt -c %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return Int64(Data().foo())
}

open class Base1{
    static func foo(){}
}

abstract class Base <: Base1{
   private func foo(): Int32 //EXPECTED: regex private abstract function is forbidden in abstract class 'Base'

}

class Data <: Base {
   func foo(): Int32{
       return 0
   }
}
