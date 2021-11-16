// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package p0

func p0(){} // EXPECTED: regex error.*redefinition of declaration 'p0'

func main(): Int64 {
    return 0
}