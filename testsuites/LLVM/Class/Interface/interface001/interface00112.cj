// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class myClas{
  protected interface InsideInterface{} // EXPECTED: regex interface type must be toplevel
}
