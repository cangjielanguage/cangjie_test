
package pkgb

external record TimeUnit {
    TimeUnit(let a : Int32) {}
    func Hour(): Int32 {
        return a
    }
}