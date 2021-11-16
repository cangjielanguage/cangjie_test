// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan cjc version's format should be 'xx.xx.xx'


@when[cjc_version >= "0.19.001"]
func main() {
    return 0
}