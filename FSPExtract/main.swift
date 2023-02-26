//
//  main.swift
//  FSPExtract
//
//  Created by Hariz Shirazi on 2023-02-26.
//

import Foundation
import Zip


let arg1 = CommandLine.arguments[1]

print("\nFile: \(arg1)\n")

if arg1 == "--help" {
    print("Usage: fspextract [--help] [--version] /path/to/file")
} else if arg1 == "--version" {
    print("FSPExtract 0.1\nBy BomberFish\nThanks sourcelocation for reverse-engineering the .fsp format\nUses https://github.com/marmelroy/Zip for extracting")
} else if arg1 == "" {
    print("ERROR: No file specified.")
    print("Usage: fspextract /path/to/file")
} else {
    print("Extracting...\n")
    // FIXME: hardcoded
    try Zip.unzipFile(URL.init(fileURLWithPath: "/Users/hariz/file.fsp"), destination: URL.init(fileURLWithPath: "/Users/hariz"), overwrite: true, password: "aVBob25l5oyB44Gj44Gm6LuK5Lit5rOK44Gu5peF44Gr6KGM44GN44Gf44GE44Gq44CC44GC44Gj44Gf44GL44GE44Gf44G+44GU44KC6aOf44G544Gf44GE44GX44CC", progress: { (progress) -> () in
        print(progress)
        
    })
    print("Done!")
}
