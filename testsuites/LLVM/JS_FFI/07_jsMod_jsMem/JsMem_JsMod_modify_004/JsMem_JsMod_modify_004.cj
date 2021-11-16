// DEPENDENCE: momentMember.js momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

@JsMember["./momentMember"] record A{} // EXPECTED: regex xxx

@JsModule["./momentModule"] record B{} // EXPECTED: regex xxx