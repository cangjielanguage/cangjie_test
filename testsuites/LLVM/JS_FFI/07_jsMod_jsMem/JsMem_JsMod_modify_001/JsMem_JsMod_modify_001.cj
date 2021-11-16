// DEPENDENCE: momentMember.js momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

@JsMember["./momentMember"] class A{    // EXPECTED: regex xxx
	static func isMoment(arg: (Float16)->Float16) : Unit{}	
}

@JsModule["./momentModule"] class B{   // EXPECTED: regex xxx
	static func isMoment(arg: (Float16)->Float16) : Unit{}	
}