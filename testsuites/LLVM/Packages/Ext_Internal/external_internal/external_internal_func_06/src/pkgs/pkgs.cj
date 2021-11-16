package pkgs

internal func goo(){6}

external func foo(x!:()->Int64=goo){
    return x
}