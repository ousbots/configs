## Base 16 Shell
#if status --is-interactive
#    eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
#end

# Login shell only stuff
if status --is-login

	# Environment variables
	set RIPGREP_CONFIG_PATH /Users/tim/.config/ripgreprc

	# PATH
	# Go: /Users/tim/go/bin
	contains /Users/tim/go/bin $PATH
	or set PATH /Users/tim/go/bin $PATH

	# Rust: /Users/tim/.cargo/bin
	contains /Users/tim/.cargo/bin $PATH
	or set PATH /Users/tim/.cargo/bin $PATH

	# Enable vi mode
	fish_vi_key_bindings

	# starship
	eval (starship init fish)

	# ESP32 paths
	set IDF_PYTHON_ENV_PATH /Users/tim/.espressif/python_env/idf4.1_py2.7_env
	set OPENOCD_SCRIPTS /Users/tim/.espressif/tools/openocd-esp32/v0.10.0-esp32-20191114/openocd-esp32/share/openocd/scripts
	set PATH /Users/tim/.espressif/tools/xtensa-esp32-elf/esp-2019r2-8.2.0/xtensa-esp32-elf/bin /Users/tim/.espressif/tools/xtensa-esp32s2-elf/esp-2019r2-8.2.0/xtensa-esp32s2-elf/bin /Users/tim/.espressif/tools/esp32ulp-elf/2.28.51-esp-20191205/esp32ulp-elf-binutils/bin /Users/tim/.espressif/tools/esp32s2ulp-elf/2.28.51-esp-20191205/esp32s2ulp-elf-binutils/bin /Users/tim/.espressif/tools/openocd-esp32/v0.10.0-esp32-20191114/openocd-esp32/bin /Users/tim/.espressif/python_env/idf4.1_py2.7_env/bin /Users/tim/.espressif/esp-idf/tools /Users/tim/.espressif/esp-idf/components/esptool_py/esptool /Users/tim/.espressif/esp-idf/components/espcoredump /Users/tim/.espressif/esp-idf/components/partition_table $PATH

	# Broot
	source /Users/tim/Library/Preferences/org.dystroy.broot/launcher/fish/br

end
