// DEPENDENCE: p1
// EXEC-PIPE-1: %compiler %cmp_opt -c p1/a.cj -o a.%middle  2>&1 | compare %f
// ASSERT: regex error.*illegal object in toplevel, toplevel must consist of declaration or definition

import p1.a

func main(): Int64 {
    return 0
}