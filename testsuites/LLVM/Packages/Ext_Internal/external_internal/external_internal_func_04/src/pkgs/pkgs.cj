package pkgs

internal func goo(){3}

external func foo(){
    var a = goo
    return a
}