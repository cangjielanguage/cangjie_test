// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args

from os import os.*
from io import io.*

// CREATE A TEST DIR TO TEST FOR PLATFORM ADAPTION
var pwd_path: String = Directory.GetWorkingDirectory().GetCanonicalPath()
var test_path0 = pwd_path + "/test0"
var nameCnt: Int64 = 0;
var testPathBaseLength = pwd_path.size() + 5
let nameCntLimit = 15;
let maxPathLength = 512

func tryNewName() {
    if ("${nameCnt}".size() < nameCntLimit) {
        test_path0 = test_path0.substring(0, testPathBaseLength) + "_${nameCnt}"
        nameCnt = nameCnt + 1
        return
    }
    nameCnt = 0
    testPathBaseLength = testPathBaseLength + nameCntLimit
    return
}

func createAndGetTestDirInPwd(): String {
    // TO AVOID THERE EXISTS SAME-NAME FILE IN THE CURRENT WORKING DIRECTORY
    while (Directory.Exist(test_path0) && test_path0.size() < maxPathLength) {
        tryNewName()
    }
    if (test_path0.size() >= maxPathLength) {
        return ""
    }
    var test_path1 = test_path0 + "/test1"
    var test_path2 = test_path1 + "/test2"
    var test_path3 = test_path2 + "/test3"
    var test_path_tmp = test_path3 + "/tmp"

    if (!Directory.Create(test_path0)) { return "" }
    if (!Directory.Create(test_path1)) { return "" }
    if (!Directory.Create(test_path2)) { return "" }
    if (!Directory.Create(test_path3)) { return "" }
    if (!Directory.Create(test_path_tmp)) { return "" }
    return test_path3
}

func deleteTestDirInPwd(): Bool {
    if (!Directory.Delete(test_path0, true)) { return false }
    if (Directory.Exist(test_path0)) { return false }
    return true
}

func main(): Int64{

    var test_dir: String = createAndGetTestDirInPwd()
    if (test_dir.size() <= 0) {
        if (test_path0.size() >= maxPathLength) {
            return 1
        }
        if (Directory.Exist(test_path0)) {
            deleteTestDirInPwd()
        }
        return 1
    }
	
    var di1: DirectoryInfo = DirectoryInfo(test_dir + "/" + "./Dir1")

    let di1s: DirectoryInfo = di1.CreateSubdirectory("subDir1")
    let di2s: DirectoryInfo = di1.CreateSubdirectory("subDir2")
    let di3s: DirectoryInfo = di1.CreateSubdirectory("subDir3")

    if (!di1.Create() || !di1s.Create() || !di2s.Create() || !di3s.Create()) {
        return 1
    }

    var file1: FileInfo = FileInfo(test_dir + "/" + "./Dir1/file1.txt")

    var file2: FileInfo = FileInfo(test_dir + "/" + "./Dir1/file2.txt")

    if (!file1.Create()) {
        return 1
    }

    if (!file2.Create()) {
        return 1
    }

    /*
    if (di1.GetDirectories().size() != 3) {
        return 1
    }

    if (di1.GetFiles().size() != 2) {
        return 1
    }*/

    //temp solution
    var num_Dirs = di1.GetDirectories()
    var num_Files = di1.GetFiles()

    if (num_Dirs.size != 3) {
        return 1
    }

    if (num_Files.size != 2) {
        return 1
    }

    if (!di1.Delete(true)) {
        return 1
    }
	if (!deleteTestDirInPwd()) {
		return 1 
	}
    return 0
}