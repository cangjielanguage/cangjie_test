// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

type UserId = Int64
func checkUserId(uid: UserId) { }
func checkUserId(uid: Int64) { }   // error, UserId is equivalent to Int64
