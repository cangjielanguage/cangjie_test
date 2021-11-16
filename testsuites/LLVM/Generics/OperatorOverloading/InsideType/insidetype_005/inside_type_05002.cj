// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface A<T>{
    //operator func ~(a:A<T>):Bool {true} // expected: regex type check of operator overload
    //operator func !(a:A<T>):Bool {true} // expected: regex type check of operator overload
    //operator func +(a:A<T>):Bool {true} // expected: regex type check of operator overload
    //operator func -(a:A<T>):Bool {true} // expected: regex type check of operator overload
    /*
    operator func ++(a:A<T>):Bool {true} // expected: regex type check of operator overload
    operator func --(a:A<T>):Bool {true} // expected: regex type check of operator overload
    */
    operator func []():Bool {true} // EXPECTED: regex-auto invalid number of parameters for operator '[]'
    operator func **():Bool {true} // EXPECTED: regex-auto invalid number of parameters for operator '**'
    operator func *():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '*'
    operator func /():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '/'
    operator func %():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '%'
    operator func +():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '+'
    //operator func -():Bool  {true} // expected: regex type check of operator overload
    operator func <<():Bool {true} // EXPECTED: regex-auto invalid number of parameters for operator '<<'
    operator func >>():Bool {true} // EXPECTED: regex-auto invalid number of parameters for operator '>>'
    operator func <():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '<'
    operator func <=():Bool {true} // EXPECTED: regex-auto invalid number of parameters for operator '<='
    operator func >():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '>'
    operator func >=():Bool {true} // EXPECTED: regex-auto invalid number of parameters for operator '>='
    operator func ==():Bool {true} // EXPECTED: regex-auto invalid number of parameters for operator '=='
    operator func !=():Bool {true} // EXPECTED: regex-auto invalid number of parameters for operator '!='
    operator func &():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '&'
    operator func ^():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '^'
    operator func |():Bool  {true} // EXPECTED: regex-auto invalid number of parameters for operator '|'

}


func main(): Int64 {
    return 1
}
