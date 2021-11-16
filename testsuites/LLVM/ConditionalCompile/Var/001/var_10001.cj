// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@when[os == "linux"]
func main() {
    print("linux\n")
    return 0
}

@when[os == "windows"]
func main() {
    print("windows\n")
    return 0
}

@when[os == "macOSX"]
func main() {
    print("macOSX\n")
    return 0
}

@when[os == "wasi"]
func main() {
    print("wasi\n")
    return 0
}

@when[os == "ios"]
func main() {
    print("ios\n")
    return 0
}

@when[os == "android"]
func main() {
    print("android\n")
    return 0
}

@when[os == "unix"]
func main() {
    return 0
}

@when[os == "freeBSD"]
func main() {
    return 0
}