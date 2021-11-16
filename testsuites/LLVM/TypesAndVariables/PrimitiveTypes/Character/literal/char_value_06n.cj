// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex empty character is not allowed
// ASSERT: regex-auto character literal is missing ''' in the end
// ASSERT: regex-auto illegal object in toplevel, toplevel must consist of declaration or definition
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var c: Char = '''
