#!/bin/bash
set -eu ; set -o pipefail

# Test script for dump-keyring0-format utility
# This script tests the password functionality of the dump-keyring0-format utility

KEYRING_FILE="/home/fedora/.local/share/keyrings/login.keyring"
CORRECT_PASSWORD="fedora"
WRONG_PASSWORD="wrong-password"

echo "Testing dump-keyring0-format utility..."

# Check if the utility exists
if [[ ! -f "/opt/gkr-debug/bin/dump-keyring0-format" ]]; then
    echo "ERROR: dump-keyring0-format utility not found at /opt/gkr-debug/bin/dump-keyring0-format"
    exit 1
fi

# Check if the keyring file exists
if [[ ! -f "${KEYRING_FILE}" ]]; then
    echo "ERROR: Keyring file not found at ${KEYRING_FILE}"
    exit 1
fi

echo "Keyring file: ${KEYRING_FILE}"
echo ""

# Test with correct password
echo "=== Testing with correct password ==="
cat > /tmp/expect-correct.exp << EOF
#!/usr/bin/expect -f
set timeout 30
spawn /opt/gkr-debug/bin/dump-keyring0-format "${KEYRING_FILE}"
expect "Password: "
send "${CORRECT_PASSWORD}\r"
expect eof
EOF

expect -f /tmp/expect-correct.exp > /tmp/dump-correct.txt 2> /tmp/dump-correct.err
exit_code=$?

# Check for success indicators in the output
if [[ -s /tmp/dump-correct.txt ]] && grep -q "display-name=test-dump-password" /tmp/dump-correct.txt && grep -q "secret=hello-world" /tmp/dump-correct.txt; then
    echo "SUCCESS: dump-keyring0-format worked with correct password"
    echo "Output preview (first 10 lines):"
    head -10 /tmp/dump-correct.txt
    echo ""
    echo "Full output saved to: /tmp/dump-correct.txt"
else
    echo "FAILED: dump-keyring0-format failed with correct password"
    echo "Exit code: ${exit_code}"
    echo "Error output:"
    cat /tmp/dump-correct.err
    echo "Stdout output:"
    cat /tmp/dump-correct.txt
fi

echo ""

# Test with wrong password
echo "=== Testing with wrong password ==="
cat > /tmp/expect-wrong.exp << EOF
#!/usr/bin/expect -f
set timeout 30
spawn /opt/gkr-debug/bin/dump-keyring0-format "${KEYRING_FILE}"
expect "Password: "
send "${WRONG_PASSWORD}\r"
expect eof
EOF

expect -f /tmp/expect-wrong.exp > /tmp/dump-wrong.txt 2> /tmp/dump-wrong.err
exit_code=$?

# Check for success indicators in the output
if [[ -s /tmp/dump-wrong.txt ]] && grep -q "display-name=test-dump-password" /tmp/dump-wrong.txt && grep -q "secret=hello-world" /tmp/dump-wrong.txt; then
    echo "WARNING: dump-keyring0-format succeeded with wrong password (unexpected)"
    echo "Output preview (first 10 lines):"
    head -10 /tmp/dump-wrong.txt
else
    echo "EXPECTED: dump-keyring0-format failed with wrong password"
    echo "Exit code: ${exit_code}"
    echo "Error output:"
    cat /tmp/dump-wrong.err
    echo "Stdout output:"
    cat /tmp/dump-wrong.txt
fi

echo ""

# Test with no password (should fail)
echo "=== Testing with no password ==="
cat > /tmp/expect-empty.exp << EOF
#!/usr/bin/expect -f
set timeout 30
spawn /opt/gkr-debug/bin/dump-keyring0-format "${KEYRING_FILE}"
expect "Password: "
send "\r"
expect eof
EOF

expect -f /tmp/expect-empty.exp > /tmp/dump-empty.txt 2> /tmp/dump-empty.err
exit_code=$?

# Check for success indicators in the output
if [[ -s /tmp/dump-empty.txt ]] && grep -q "display-name=test-dump-password" /tmp/dump-empty.txt && grep -q "secret=hello-world" /tmp/dump-empty.txt; then
    echo "WARNING: dump-keyring0-format succeeded with empty password (unexpected)"
    echo "Output preview (first 10 lines):"
    head -10 /tmp/dump-empty.txt
else
    echo "EXPECTED: dump-keyring0-format failed with empty password"
    echo "Exit code: ${exit_code}"
    echo "Error output:"
    cat /tmp/dump-empty.err
    echo "Stdout output:"
    cat /tmp/dump-empty.txt
fi

# Clean up expect script files
rm -f /tmp/expect-correct.exp /tmp/expect-wrong.exp /tmp/expect-empty.exp

echo ""
echo "Test completed. Temporary files:"
echo "  /tmp/dump-correct.txt - Output with correct password"
echo "  /tmp/dump-correct.err - Errors with correct password"
echo "  /tmp/dump-wrong.txt   - Output with wrong password"
echo "  /tmp/dump-wrong.err   - Errors with wrong password"
echo "  /tmp/dump-empty.txt   - Output with empty password"
echo "  /tmp/dump-empty.err   - Errors with empty password" 