// ERRCHECK: %compiler -config="(a=1)" %cmp_opt %f -o %output

@when[a=="1"]
package a  // EXPECTED: regex-auto @when can not be used on package name declaration

@when[a=="1"]
func main(){
    print("a = 1\n")
    0
}
