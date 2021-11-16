import java.lang.*

@java
class Test {
    func test(): Unit {
        var a = @{1, 2}
        var i: Int64 = 0
        while(i < 3) {
            var b: Int64 = a[i]
            i++
        }
    }
}
