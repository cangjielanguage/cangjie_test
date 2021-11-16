// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


func main(): Int64 {
    return 0
}

interface I1<T> {
    func foo1(x:T):Int64{
        return 1
    }
}
interface I2<T> {
    func foo2(x:T):Int32{
        return 2
    }
}

// x of "init(x:T)" will be shadow x of "var x:T"
class B<T> <: I1<T> & I2<T> {
    var x:T
    init(x:T){
        x = x // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
    }
}
