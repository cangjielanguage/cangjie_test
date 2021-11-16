// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package p0
external var a = 1
import p1.foo //EXPECTED: regex error.*illegal object in toplevel, toplevel must consist of declaration or definition

func main(): Int64 {
    return 0
}