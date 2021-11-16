// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan ccc

open class A <: Throwable{
    override open func getMessage(){"aaa"}
    func a(){}
}
open class B <: A{}
open class C <: B{
    override func getMessage(){"ccc"}
    func c(){}
}
class D <: C{}

func test(){
    try {
        throw C()
    } catch (a:A) {
        print(a.getMessage())
        match (a){
            case _:D => return 2
            case _:C => return 0
            case _:A => return 1
            case _ => return -1
        }
    }
}


func main() {
    test()
}
