//
//  FileUtil.swift
//
//
//  Created by Rodrigo Soldi on 24/08/24.
//

import Foundation

struct FileUtil {

	private let packageName = "LiturgyDatabase"
	private let productName = "LiturgyMakeDatabase"

	func getLiturgiesFolderPath() -> String {
		print("Main Bundle Path: \(Bundle.main.bundlePath)")
		let bundlePath = Bundle.main.bundlePath + "/\(packageName)_\(productName).bundle"

		print("Bundle Path: \(bundlePath)")
		let bundle = Bundle(path: bundlePath)

		let filePath = (bundle?.bundlePath ?? "") + "/Liturgies"
		return filePath
	}

	func getLiturgiesFiles(basePath: String) -> [String] {
		let files = try? FileManager.default.contentsOfDirectory(atPath: basePath)
		return files ?? []
	}

	func loadLiturgiesData(at path: String) -> Data? {
		guard let fileData = FileManager.default.contents(atPath: path) else {
			return nil
		}

		return fileData
	}

}
