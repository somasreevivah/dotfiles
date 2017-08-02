source ${HOME}/.bashrc

assert()
{
E_PARAM_ERR=98
E_ASSERT_FAILED=99
if [ -z "$2" ]; then
  lineno=?
else
  lineno=$2
fi
if ! $1 > /dev/null; then
  cat <<EOF
Assertion failed:  \"$1\"
File \"$0\", line $lineno
EOF
  exit $E_ASSERT_FAILED
fi
}
