// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A_B<T> <: A<T>{}
interface A<T>{
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
    var a : A<Char> = A_B<Char>()
    var b : A<Char> = A_B<Char>()
    var result : Array<(Char)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
