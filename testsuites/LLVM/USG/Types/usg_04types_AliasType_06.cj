// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

package A
external class ClassWithALongNameA { }
internal class ClassWithALongNameB { }

type UserId = Int64
external type ClassA = ClassWithALongNameA
external type ClassB = ClassWithALongNameB  // error, since ClassWithALongNameB is internal
internal type ClassB2 = ClassWithALongNameB


package B
import A.*
let myClassA: A.ClassA = ClassWithALongNameA()
