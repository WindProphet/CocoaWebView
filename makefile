all:
	mkdir bin
	swiftc -module-name webview -o bin/webview -Onone -sdk `xcrun --show-sdk-path --sdk macosx` -target x86_64-apple-macosx10.12 main.swift
clean:
	rm -rf bin
