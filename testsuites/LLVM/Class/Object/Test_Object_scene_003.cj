// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex is not a member of class


//define class
open class Object {
    init() {
        var a = super.a
    }
}

var a: Object = Object()
var b: Object = Object()


func main(): Int64 {

    return 0

}
