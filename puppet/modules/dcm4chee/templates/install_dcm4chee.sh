#!/usr/bin/env bash

if test -d "<%= @dcm4chee_server_default_location %>/archive";
then
    sudo mv "<%= @dcm4chee_server_default_location %>/archive" "<%= @bahmni_location %>"
fi

sudo rm -rf "<%= @dcm4chee_location %>"
sudo unzip -o -q "<%= @build_output_dir %>/<%= @dcm4chee_zip_filename %>.zip" -d "<%= @bahmni_location %>"
sudo mkdir -p "<%= dcm4chee_location %>"
if test "<%= is_passive_setup %>" == false;
then
    echo "Creating tables for dcm4chee."
    psql -Upostgres pacsdb -f "<%= @dcm4chee_location %>/sql/create.psql"
fi
sudo rm -rf "<%= jboss_location %>"
sudo unzip -o -q "<%= @packages_servers_dir %>/<%= jboss_zip_filename.zip %>" -d "<%= @share_location %>"
sudo sh "<%= dcm4chee_location %>"/bin/install_jboss.sh "<%= jboss_location %>"

if test -d "<%= @bahmni_location %>/archive";
then
    sudo mv "<%= bahmni_location %>/archive" "<%= @dcm4chee_server_default_location %>"
fi