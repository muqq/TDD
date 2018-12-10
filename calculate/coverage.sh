xcodebuild -configuration Debug -scheme calculate CONFIGURATION_TEMP_DIR=intermediates -destination 'platform=iOS Simulator,name=iPhone 7,OS=10.3' clean

xcodebuild GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES -scheme calculate CONFIGURATION_TEMP_DIR=intermediates -destination 'platform=iOS Simulator,name=iPhone 7,OS=10.3' test 2>&1 > test_log.txt || true
cat test_log.txt | ocunit2junit

# generate coverage report
gcovr -v -r . --xml --output=coverage.xml --object-directory=./intermediates/calculateTests.build/Objects-normal/x86_64
