// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

//brief：插值字符串中为各种定义和表达式
func main() {
   var c = 1
   var a1 = "${()}" // EXPECTED: regex error.*undeclared identifier 'toString'
   var a2 = "${var a = 1}" // EXPECTED: regex error.*undeclared identifier 'toString'
   "${var a = 1}" // EXPECTED: regex error.*undeclared identifier 'toString'
   var a = 1 // EXPECTED: regex-not error
   var a2_ = "${var a = 1;1}" // EXPECTED: regex-not error
   var a3 = "${func foo(){}}" // EXPECTED: regex error.*undeclared identifier 'toString'
   "${func foo(){}}" // EXPECTED: regex error.*undeclared identifier 'toString'
   func foo(){} // EXPECTED: regex-not error
   var a3_ = "${func foo(){};1}" // EXPECTED: regex-not error
   var a4 = "${{1}()}" // EXPECTED: regex-not error
   var a5 = "${{1}}" // EXPECTED: regex error.*undeclared identifier 'toString'
   var a6 = "${match (1){ case _ => 1}}"  // EXPECTED: regex-not error
   var a7 = "${if(true){1}}"  // EXPECTED: regex error.*undeclared identifier 'toString'
   var a8 = "${if(true){1}else{1}}" // EXPECTED: regex-not error

   var a9_ = "${class A{};1}" // EXPECTED: regex error.*illegal string interpolation expr
   var a9 = "${class A{}}" // EXPECTED: regex error.*illegal string interpolation expr

   return 0
}
