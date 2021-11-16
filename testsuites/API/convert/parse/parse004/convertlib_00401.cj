// EXEC: %compiler %cmp_opt -backend-options="%stdx-package %link-convert" %f -o %n%suffix 2>&1 | compare %f

from std import convert.*

func main():Int64 {
    parseChar(/)  // EXPECTED: regex expected expression here
}