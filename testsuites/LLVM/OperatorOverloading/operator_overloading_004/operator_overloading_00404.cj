// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record A{
    let a : Int32
    func test(){
        operator func + (inputB:A):Bool{
          return true
        }
        return
    }
}

class C{
    let a : Int32
    func test(){
        operator func + (inputB:C):Bool{
          return true
        }
        return
    }
    init(a:Int32) {
        this.a = a
    }
}

interface I{
    let a : Int32 = 1
    static func test(){
        operator func + (inputB:I):Bool{
          return true
        }
        return
    }
}

class B <: I{}

func main():Int64{
    let a = A(1)
    let b : I = B()
    let c = C()
     if (a+a && b+b && c+c) { // EXPECTED: regex error.*?invalid binary operator \'\+\' on type \'Interface-I\' and \'Interface-I\'
        return 1
    }
    return 0
}
