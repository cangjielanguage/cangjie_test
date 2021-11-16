// EXEC: %compiler -x 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?invalid option.*?'-x'
// ASSERT: regex Usage:
// ASSERT: regex-auto cjc [option] file...
