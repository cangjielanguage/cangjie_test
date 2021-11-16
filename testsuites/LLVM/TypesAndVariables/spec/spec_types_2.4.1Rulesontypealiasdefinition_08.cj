// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
package A 

class ClassWithLongNameB {}
/* error: classB can not be declared with modifier 'external', as 'ClassWithLongNameB' is (by default) declared with modifier 'internal' */
external type classB = ClassWithLongNameB // EXPECTED: regex external type 'classB' refers to internal 'ClassWithLongNameB'

func main(){
    return 0
}

