// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(T)
    operator func |(y:A<T>):Int64{0}
    operator func ^(y:A<T>):Int64{0}
    operator func &(y:A<T>):Int64{0}
    operator func ==(y:A<T>):Int64{0}
    operator func !=(y:A<T>):Int64{0}
    operator func >=(y:A<T>):Int64{0}
    operator func >(y:A<T>):Int64{0}
    operator func <=(y:A<T>):Int64{0}
    operator func <(y:A<T>):Int64{0}
    operator func <<(y:A<T>):Int64{0}
    operator func >>(y:A<T>):Int64{0}
    operator func +(y:A<T>):Int64{0}
    operator func -(y:A<T>):Int64{0}
    operator func %(y:A<T>):Int64{0}
    operator func /(y:A<T>):Int64{0}
    operator func *(y:A<T>):Int64{0}
    operator func **(y:A<T>):Int64{0}
    operator func -():Int64{0}
    operator func !():Int64{0}
    operator func [](y:A<T>):Int64{0}


}


func main(): Int64 {
    A.a(1)|A.a(1)
    A.a(1)^A.a(1)
    A.a(1)&A.a(1)
    A.a(1)==A.a(1)
    A.a(1)!=A.a(1)
    A.a(1)>=A.a(1)
    A.a(1)>A.a(1)
    A.a(1)<A.a(1)
    A.a(1)<=A.a(1)
    A.a(1)<<A.a(1)
    A.a(1)>>A.a(1)
    A.a(1)+A.a(1)
    A.a(1)-A.a(1)
    A.a(1)%A.a(1)
    A.a(1)/A.a(1)
    A.a(1)*A.a(1)
    A.a(1)**A.a(1);
    -A.a(1)
    !A.a(1)
    A.a(1)[A.a(1)]
    return 0
}

