// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex  initializer's type is incompatible with variable declaration 'MyTuple'
class A{}

class B{}

func main(): Int64 {
    var a = A()
    var MyTuple : B*A = (a,B())
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
