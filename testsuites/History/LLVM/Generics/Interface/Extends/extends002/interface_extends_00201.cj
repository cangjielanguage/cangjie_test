// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{
func abstract_foo():Int32
func default_foo():Int32{1}
static func static_foo():Int32{1}
let a : Int32 = 1
}

interface B <: A{
override func default_foo():Int32{2}
}

class C <: B{
func abstract_foo():Int32{2}
}


func main(){
var b : B = C()
if B.a != Int32(1){ // EXPECTED: regex 'a' is not a member of interface 'B'
print("static variable failed!")
return 1
}
if B.static_foo() != Int32(1){ // EXPECTED: regex 'static_foo' is not a member of interface 'B'
print("static_foo failed!")
return 1
}
if b.abstract_foo() != Int32(2){
print("abstract_foo failed!")
return 1
}
if b.default_foo() != Int32(2){
print("default_foo failed!")
return 1
}
return 0
}
