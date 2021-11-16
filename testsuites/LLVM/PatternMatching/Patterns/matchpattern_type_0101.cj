// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64 {
    let b = Boo()
    var res:Int64  = match (b) {
        case x:Aoo => x.boo()-1 // EXPECTED: regex error.*'boo' is not a member of class 'Aoo'
        case x:Boo => x.boo()
        case _ => 2
    }
    return res
}

open class Aoo{
    var a = 1
    func aoo(){ return a}
}
class Boo <: Aoo {
    var b = 1
    func boo(){ return b}
}