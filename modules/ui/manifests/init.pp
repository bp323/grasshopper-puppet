class ui (
    $ui_root_dir        = '/opt/grasshopper-ui',

    $install_method     = 'git',
    $install_config     = {
        'source' => 'https://github.com/CUL-DigitalServices/grasshopper-ui',
        'revision' => 'master'
    }) {

    class { "::ui::install::${install_method}":
        install_config  => $install_config,
        ui_root_dir     => $ui_root_dir
    } ->

    # Install the git submodules
    exec { 'install_git_submodules':
        cwd        => $ui_root_dir,
        command    => 'git submodule update --init --recursive',
    }
}
