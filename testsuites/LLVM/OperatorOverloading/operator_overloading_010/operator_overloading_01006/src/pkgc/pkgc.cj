
package pkgc

external interface TR3 {
    operator func <<(b:Bool):Bool
    operator func >>(b:Bool):Bool
    operator func <(b:Bool):Bool
    operator func <=(b:Bool):Bool
    operator func >(b:Bool):Bool
    operator func >=(b:Bool):Bool
    operator func ==(b:Bool):Bool
    operator func !=(b:Bool):Bool
    operator func &(b:Bool):Bool
    operator func ^(b:Bool):Bool
    operator func |(b:Bool):Bool
//        operator func ^^(b:Bool):Bool
}
