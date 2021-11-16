// DEPENDENCE: ../module_name
// EXEC: %compiler %cmp_opt -c ./module_name/src/package1/*.cj -o module_name/package1.%middle  && %copycharjs module_name
// EXEC: %compiler %cmp_opt -c ./module_name/src/package2/*.cj -o module_name/package2.%middle  && %copycharjs module_name
// EXEC-PIPE-1: %compiler %cmp_opt module_name/package1.%middle module_name/package2.%middle %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

from module_name import package1 // EXPECTED:regex error.*?it doesn't support importing package by package name

func main(): Int64 {
   
    return 0
}