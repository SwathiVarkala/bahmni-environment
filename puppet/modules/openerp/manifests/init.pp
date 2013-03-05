class openerp{
    file { "add-installation-script" :
        ensure      => present,
        path        => "/tmp/install_openerp.sh",
        content     => template("openerp/install_openerp.sh"),
        mode        => 764,
    }

    exec { "add-installation-script":
        provider    => "shell",
        command     => "/bin/sh /tmp/install_openerp.sh",
        require     => File["add-user-to-sudoers.sh"],
    }
}