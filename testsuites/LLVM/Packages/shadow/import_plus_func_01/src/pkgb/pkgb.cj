package pkgb
import pkga.*


external func Data_b<T>(x:T):T {
    let b: T = pkga.Data_a<T>(x)
    return b
}