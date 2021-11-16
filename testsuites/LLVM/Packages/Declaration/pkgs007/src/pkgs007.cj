// EXEC: %compiler %cmp_opt -c %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto illegal object in toplevel

external let one : Int32 = 1
external let two : Int32 = 2
external let pi : Float32 = 3.1415

package pkgs007
