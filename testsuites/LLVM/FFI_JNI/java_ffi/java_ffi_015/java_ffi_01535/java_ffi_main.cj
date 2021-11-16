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
class A <: InteropTest.InnerInterface {
    func test(): Int32 {
        return InteropTest.InnerInterface.num2
    }

    override func defaultFunc(): Int32 { //EXPECTED: regex invalid 'override' modifier when implementing an abstract function
        return num2 + 10;
    }

    redef static func staticFunc(): Int32 { //EXPECTED: regex invalid 'redef' modifier when implementing an abstract function
        return num2 + 20;
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.test() == 1 && a.defaultFunc() == 11 && A.staticFunc() == 21) {
        print("PASS\n")
        return 0
    }
    return 1
}
