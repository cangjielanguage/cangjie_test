// DEPENDENCE: momentMember.js momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{}
class B{}

@JsMember["./momentMember"] extend A{}  // EXPECTED: regex modifier is not allowed here

@JsModule["./momentModule"] extend B{}  // EXPECTED: regex modifier is not allowed here