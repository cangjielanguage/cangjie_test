// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
interface A <: InteropTest.InnerInterface {
    func test(): Int32 {
        return InteropTest.InnerInterface.num2
    }
    override func defaultFunc(): Int32 { //EXPECTED: regex 'override' modifier is illegal for function declaration in interface body
        return num2 + 10;
    }

    redef static func staticFunc(): Int32 { //EXPECTED: regex 'redef' modifier is illegal for function declaration in interface body
        return num2 + 20;
    }
}

@java
class B <: A {}

func main(): Int64 {
    var inner: B = B()
    if (inner.test() == 1 && inner.defaultFunc() == 11 && B.staticFunc() == 21) {
        print("PASS\n")
        return 0
    }
    return 1
}
