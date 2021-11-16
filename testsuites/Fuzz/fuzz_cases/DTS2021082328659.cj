// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package p1

external inteexternal interface Num<T> {
    func add(other: T): T
}
extend Int32 <: Num<Int32> {
    func add) {
        this + other
    }
}
external var a : Int32 = 1
external class C { var c = 1 