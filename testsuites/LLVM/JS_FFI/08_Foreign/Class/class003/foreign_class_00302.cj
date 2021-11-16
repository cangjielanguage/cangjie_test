// DEPENDENCE: ./a  import.cfg
// EXEC: %compiler %cmp_opt -c %backendjs ./a/a.cj -o a.%middle
// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import a.*

class B <: A{} // EXPECTED: regex xxx