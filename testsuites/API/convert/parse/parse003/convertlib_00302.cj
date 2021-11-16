// EXEC: %compiler %cmp_opt -backend-options="%stdx-package %link-convert" %f -o %n%suffix 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    parseBool("1","2")  // EXPECTED: regex extra argument given for call with parameter list
}