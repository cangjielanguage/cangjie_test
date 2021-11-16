// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex 'public' is keyword not identifier, you can use '`public`' instead


class Data {
     var public  a  : Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
