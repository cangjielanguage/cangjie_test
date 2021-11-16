package pkga

external var aa = 0
external open class Boo{
    open func foo(): This{
        aa++
        this
    }
}
