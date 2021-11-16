// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    public var pub: Int32 = 1
    protected var pro: Int32 = 10
    private var pri: Int32 = 100

}

class B <: A {
    public var a1 : Int32
    public var a2 : Int32

    protected var b1 : Int32
    protected var b2 : Int32

    func getpro1():Int32 {return b1}
    func getpro2():Int32 {return b2}

    private var c1 : Int32
    private var c2 : Int32

    func getpri1():Int32 {return c1}
    func getpri2():Int32 {return c2}

    init() {
        a1 = pub
        a2 = pro

        b1 = pub
        b2 = pro

        c1 = pub
        c2 = pro
    }
}

func main(): Int64 {

    var newClass:B = B()

    if (newClass.a1 != 1 || newClass.a2 != 10) {
        return 1
    }

    if (newClass.getpro1() != 1 || newClass.getpro2() != 10) {
        return 1
    }

    if (newClass.getpri1() != 1 || newClass.getpri2() != 10) {
        return 1
    }


    return 0
}
