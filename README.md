Simple Android PDF viewer based on pdf.js and content providers. The app
doesn't require any permissions. The PDF stream is fed into the sandboxed
WebView without giving it access to the network, files, content providers or
any other data.

Content-Security-Policy is used to enforce that the JavaScript and styling
properties within the WebView are entirely static content from the APK assets
along with blocking custom fonts since pdf.js handles rendering those itself.

It reuses the hardened Chromium rendering stack while only exposing a tiny
subset of the attack surface compared to actual web content. The PDF rendering
code itself is memory safe with dynamic code evaluation disabled, and even if
an attacker did gain code execution by exploiting the underlying web rendering
engine, they're within the Chromium renderer sandbox with less access than it
would have within the browser.

## CI builds

The project is built as an Android APK. The GitHub Actions workflow in
`.github/workflows/build.yml` runs the build on the GitHub-hosted
`windows-2022` runner and publishes the APK outputs from
`app/build/outputs/apk/` as workflow artifacts.

## Windows builds

This repository targets Android only and does not produce a Windows portable
EXE or MSI. Creating a Windows installer would require a separate
desktop application (for example, an Electron/WebView2-based wrapper) that
reuses the `viewer/` assets and implements native Windows file handling. That
desktop packaging work is outside the scope of this Android project.
