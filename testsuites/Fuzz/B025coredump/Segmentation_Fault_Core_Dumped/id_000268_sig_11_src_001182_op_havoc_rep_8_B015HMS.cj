// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A{
    var a : Int32
    init(a:Int32){
       this.a = a
 open
}

interface C {}

class B implements C{
    var b : Int32
   init(b:Int32){
        this.b = b
    }
}

func main(): Int64 {
    var l : C = B(1)
    var r : A = A(2)
  ( l = r 
    if .a == 2 {
        return 0
    }
    return 1
}
