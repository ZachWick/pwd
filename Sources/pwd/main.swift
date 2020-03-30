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

if CommandLine.argc == 1 || CommandLine.arguments[1] == "-L" {
    getLogicalPath()
} else if CommandLine.argc == 2 && CommandLine.arguments[1] == "-P" {
    unknownCommand()
} else {
    unknownCommand()
}
