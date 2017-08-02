source lib.sh

echo "Checking that the header functions work"

assert "type -a dfs_arrow" $LINENO
assert "type -a dfs_error" $LINENO
assert "type -a dfs_success" $LINENO
assert "type -a dfs_warning" $LINENO
