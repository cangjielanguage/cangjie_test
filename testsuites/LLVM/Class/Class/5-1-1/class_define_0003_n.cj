// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex 'class' is keyword not identifier


class class Data {
	var data: Int32 = 128
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
