// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class A<T>{
    operator func !():String {return "a"}
//    operator func +():String {return "a"}
    operator func -():String {return "a"}
    /*
    operator func ++():String {return "a"}
    operator func --():String {return "a"}
    */
    operator func [](b:A<T>):String {return "a"}
// operator ** is illegal
    operator func *(b:A<T>):String  {return "a"}
    operator func /(b:A<T>):String  {return "a"}
    operator func %(b:A<T>):String  {return "a"}
// operator *& is illegal
    operator func +(b:A<T>):String  {return "a"}
    operator func -(b:A<T>):String  {return "a"}
    operator func <<(b:A<T>):String {return "a"}
    operator func >>(b:A<T>):String {return "a"}
    operator func <(b:A<T>):String  {return "a"}
    operator func <=(b:A<T>):String {return "a"}
    operator func >(b:A<T>):String  {return "a"}
    operator func >=(b:A<T>):String {return "a"}
    operator func ==(b:A<T>):String {return "a"}
    operator func !=(b:A<T>):String {return "a"}
    operator func &(b:A<T>):String  {return "a"}
    operator func ^(b:A<T>):String  {return "a"}
    operator func |(b:A<T>):String  {return "a"}
//     operator func ^^(b:A<T>):String {return "a"}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<String> = A<String>()
    var b : A<String> = A<String>()
    var result : Array<(String)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
