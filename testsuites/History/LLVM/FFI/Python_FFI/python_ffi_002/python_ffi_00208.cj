// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex no matching function declaration for function call

import python.*

func main():Int64 {
var python = LoadPython()
var p = python.GetBuiltin("print")
p.CallByTup()
UnloadPython()
return 0
}
