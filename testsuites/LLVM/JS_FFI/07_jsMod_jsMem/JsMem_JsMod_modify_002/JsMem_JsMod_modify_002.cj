// DEPENDENCE: momentMember.js momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = @JsMember["./momentMember"] 123 // EXPECTED: regex illegal macro expand input args

var b = @JsModule["./momentModule"] 234  // EXPECTED: regex illegal macro expand input args