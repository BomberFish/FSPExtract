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
    Zip.addCustomFileExtension("fsp")
    let manager = FileManager.default
    let extract_dir = "\(NSHomeDirectory())/fsp_extracted"
    try manager.createDirectory(atPath: extract_dir, withIntermediateDirectories: true, attributes: nil)
    print("Extracting to \(extract_dir)...\n")
    try Zip.unzipFile(URL.init(fileURLWithPath: arg1), destination: URL.init(fileURLWithPath: extract_dir), overwrite: true, password: "aVBob25l5oyB44Gj44Gm6LuK5Lit5rOK44Gu5peF44Gr6KGM44GN44Gf44GE44Gq44CC44GC44Gj44Gf44GL44GE44Gf44G+44GU44KC6aOf44G544Gf44GE44GX44CC", progress: { (progress) -> () in
        print(progress)
        
    })
    print("\nDone!")
    print("Extracted to: \(extract_dir)")
}
