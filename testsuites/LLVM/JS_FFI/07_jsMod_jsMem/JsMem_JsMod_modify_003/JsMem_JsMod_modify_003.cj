// DEPENDENCE: momentMember.js momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func isMoment(@JsMember["./momentMember"] arg: String) : String // EXPECTED: regex  expected identifier here

func moment(@JsModule["./momentModule"] arg:String) : String 