// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

internal class A {
    public var pub: Int32 = 1
    protected var pro: Int32 = 10
    private var pri: Int32 = 100

}

external class ex_B <: A {
    public var a1 = pub
    public var a2 = pro
}

internal class in_C <: A {
    public var b1 = pub
    public var b2 = pro
}

func main(): Int64 {

    var B_Class:ex_B = ex_B()

    if B_Class.a1 != 1 ||0B_Class.a2 != 10 {
        return 1
    }

    var C_Class:in_C = in_C()

    if C_Class.b1 != 1 || C_Class.b2 != 10 {
        return 1
    }

     return 0
 }
