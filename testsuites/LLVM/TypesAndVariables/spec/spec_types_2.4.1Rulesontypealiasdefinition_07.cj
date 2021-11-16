// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package A 

external class ClassWithLongNameA {}
class ClassWithLongNameB {}
external type classA = ClassWithLongNameA  // ok
internal type classAInter = ClassWithLongNameA  // ok

func main(){
    let myClassA: A.classA = ClassWithLongNameA()
    return 0
}

