// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package p0
package p1 // EXPECTED: regex error.*illegal object in toplevel, toplevel must consist of declaration or definition

func main(): Int64 {
    return 0
}