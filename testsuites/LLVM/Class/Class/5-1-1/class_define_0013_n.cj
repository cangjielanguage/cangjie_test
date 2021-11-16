// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex illegal class member in class block


class Data { 
    afdad
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
