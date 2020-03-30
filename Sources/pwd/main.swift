import Foundation

let fileManager = FileManager.default
let pwdVersion = "1.0.0"
let commandName = (CommandLine.arguments[0] as NSString).lastPathComponent

func printUsage() {
    let usageString =
        """
        \(commandName) \(pwdVersion)
        zach wick
        "present working directory"

        USAGE:
            pwd [FLAG]

        FLAGS:
            -L Display the logical current working directory.
            -P Display the physical current working directory (all symbolic links resolved).

        """
    print(usageString)
}

func unknownCommand() {
    print("Flag \(CommandLine.arguments[1]) is not supported")
    printUsage()
}

func getLogicalPath() {
    let path = fileManager.currentDirectoryPath
    print(path)
}

func getPhysicalPath() {
    let pwd = fileManager.currentDirectoryPath
    let path = NSURL.fileURL(withPath: pwd)
    let physicalPath = path.resolvingSymlinksInPath()
    print(physicalPath)
}

if CommandLine.argc == 1 || CommandLine.arguments[1] == "-L" {
    getLogicalPath()
} else if CommandLine.argc == 2 && CommandLine.arguments[1] == "-P" {
    getPhysicalPath()
} else {
    unknownCommand()
}
