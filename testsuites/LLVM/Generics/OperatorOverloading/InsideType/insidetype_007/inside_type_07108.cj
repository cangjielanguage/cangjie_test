// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Char {return 'a'}
//    operator func +():Char {return 'a'}
    operator func -():Char {return 'a'}
    /*
    operator func ++():Char {return 'a'}
    operator func --():Char {return 'a'}
    */
    operator func [](b:A<T>):Char {return 'a'}
// operator ** is illegal
    operator func *(b:A<T>):Char  {return 'a'}
    operator func /(b:A<T>):Char  {return 'a'}
    operator func %(b:A<T>):Char  {return 'a'}
// operator *& is illegal
    operator func +(b:A<T>):Char  {return 'a'}
    operator func -(b:A<T>):Char  {return 'a'}
    operator func <<(b:A<T>):Char {return 'a'}
    operator func >>(b:A<T>):Char {return 'a'}
    operator func <(b:A<T>):Char  {return 'a'}
    operator func <=(b:A<T>):Char {return 'a'}
    operator func >(b:A<T>):Char  {return 'a'}
    operator func >=(b:A<T>):Char {return 'a'}
    operator func ==(b:A<T>):Char {return 'a'}
    operator func !=(b:A<T>):Char {return 'a'}
    operator func &(b:A<T>):Char  {return 'a'}
    operator func ^(b:A<T>):Char  {return 'a'}
    operator func |(b:A<T>):Char  {return 'a'}
//     operator func ^^(b:A<T>):Char {return 'a'}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Char> = A<Char>()
    var b : A<Char> = A<Char>()
    var result : Array<(Char)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
