rockspec_format = "3.0"
package = "hush.nvim"
version = "scm-1"
source = {
	url = "https://github.com/mbienkowsk/hush.nvim",
}
dependencies = {}
test_dependencies = {
	"nlua",
}
build = {
	type = "builtin",
	copy_directories = { "plugin" },
}
