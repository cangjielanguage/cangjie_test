// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class C{}

enum A<T> <: C{ // EXPECTED: regex enum 'A' can only implement interface
    a(T)
    func test(){
        super
    }
}

func main(): Int64 {
    var i = a(1).test()
    return 1
}
