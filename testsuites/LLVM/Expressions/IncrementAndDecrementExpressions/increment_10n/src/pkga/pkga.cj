// DEPENDENCE: ../../src
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkgb.%middle 2>&1  | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


// 对权限访问受限的成员变量自增减，编译报错
package pkga

func foo(){
    Base().a1++
}

internal class Base {
    protected let a1: Int32 = 0
    protected let a2 :Int32 = 0
    private let b1: Int32 = 0
    private let b2:Int32 = 0
    init(x:Int32){
        a2 = x
    }
}

external class Data <: Base {
    var a1: Int32 = 10
    let b1: Int32 = 10
    let c1: Int32 = 10
    static let d1: Int32 = 10
    var m:Int32 = 1
    init(x:Int32){
        super(x)
        this.c1++
        super.b1++ // EXPECTED: regex error.*?can not access field 'b1'
        d1++
    }
    func get():Int32{
        this.c1++ // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
        c1++ // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
        d1++ // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
        return 0
    }
}

record Red {
    var a1: Int32 = 10
    let b1: Int32 = 10
    let c1: Int32 = 10
    var m:Int32 = 1
    init(x:Int32){
        this.c1++
    }
    func get():Int32{
        this.c1++ // EXPECTED: regex error.*? is an initialized 'let' constant
        c1++ // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
        return 0
    }
}

interface Ice {
    var a1: Int32 = 10
    let b1: Int32 = 10
    let c1: Int32 = 10
    var m:Int32 = 1
    func get():Int32{
        c1++ // EXPECTED: regex error.*?cannot assign to value which is an initialized 'let' constant
        a1++
        return 0
    }
}
