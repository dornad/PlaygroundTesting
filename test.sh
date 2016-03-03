WORKSPACE='Example/PlaygroundTesting.xcworkspace'
SCHEME='PlaygroundTesting-Example'
CONFIGURATION='Debug'

set -o pipefail && xcodebuild build test \
  -workspace ${WORKSPACE} \
  -scheme ${SCHEME} \
  -configuration ${CONFIGURATION}\
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,OS=9.3,name=iPhone 6' \
  -enableCodeCoverage YES | xcpretty -c --test