
package pkgb

external interface TR2<T>{
    operator func [](b:T):T
    operator func **(b:T):T
    operator func *(b:T):T
    operator func /(b:T):T
    operator func %(b:T):T
    operator func +(b:T):T
    operator func -(b:T):T
}
