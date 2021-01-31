// swift-tools-version:5.1
import PackageDescription

let package = Package(
	name: "iTunes",
	products: [
		.library(
			name: "iTunes",
			targets: ["iTunes"]
		),
	],
	targets: [
		.target(
			name: "iTunes"
		),
	]
)
