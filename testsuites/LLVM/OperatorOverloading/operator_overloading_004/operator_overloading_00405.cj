// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record A{
let a : Int32 = 1
}

class C{
let a : Int32 = 1
}

interface I{
let a : Int32 = 1
}

func testa(){
operator func + (inputB:A):Bool{ // EXPECTED: regex 'operator' modifier is illegal for function declaration in function body
return true
}
return
}


func testb(){
operator func + (inputB:C):Bool{ // EXPECTED: regex 'operator' modifier is illegal for function declaration in function body
return true
}
return
}

func testc(){
operator func + (inputB:I):Bool{ // EXPECTED: regex 'operator' modifier is illegal for function declaration in function body
return true
}
return
}

class B <: I{}

func main():Int64{
let a = A()
let b = B()
let c = C()
return 1
}
