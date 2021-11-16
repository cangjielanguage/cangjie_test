// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

internal class C1 {}
class C2 {}                     // internal is default modifier
external internal class C3{}      // EXPECTED: regex error.*?modifiers 'internal' and 'external' are conflict in class declaration

func main(){

    return 0
}

