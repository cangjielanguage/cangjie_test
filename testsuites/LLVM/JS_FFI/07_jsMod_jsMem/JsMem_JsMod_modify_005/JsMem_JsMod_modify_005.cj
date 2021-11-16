// DEPENDENCE: momentMember.js momentModule.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
 
@JsMember["./momentMember"] interface A{ // EXPECTED: regex xxx
	static func isMoment(arg: (Float16)->Float16) : (Float16)->Float16	 
}

@JsModule["./momentModule"] interface B{ // EXPECTED: regex xxx
	static func isMoment(arg: (Float16)->Float16) : (Float16)->Float16	
}