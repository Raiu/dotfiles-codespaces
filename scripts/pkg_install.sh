#!/usr/bin/env sh

# Check if /etc/os-release exists
if [ ! -f /etc/os-release ]; then
    echo "Error: /etc/os-release does not exist."
    exit 1
fi

# Read the ID field from /etc/os-release
while read -r field value; do
    if [ "$field" == "ID" ]; then
        id=$(echo "$id" | awk '{print tolower($0)}')
    fi
done </etc/os-release

# Check if the id variable is set
if [ -z "$os_id" ]; then
    echo "Error: ID field not found in /etc/os-release."
    exit 1
fi

# Check the distro and set the package manager and package file variables
case "$os_id" in
"debian")
    package_manager="apt-get"
    package_file="debian.list"
    install_command="install -y"
    ;;
"ubuntu")
    package_manager="apt"
    package_file="ubuntu.list"
    install_command="install -y"
    ;;
"centos" | "fedora")
    package_manager="dnf"
    package_file="redhat.list"
    install_command="install -y"
    ;;
"arch")
    package_manager="pacman"
    package_file="arch.list"
    install_command="-S --noconfirm"
    ;;
"alpine")
    package_manager="apk"
    package_file="alpine.list"
    install_command="add -y"
    ;;
*)
    echo "Error: Unable to detect distro."
    exit 1
    ;;
esac

# Elevate to root using sudo
if [ "$EUID" -ne 0 ]; then
    sudo "$0" "$@"
    exit 0
fi

# Read the package file and create a string with each package separated by a space
package_string=$(awk '{printf $0 " "}' "$package_file")

# Install the packages using the appropriate package manager and install command
$package_manager $install_command $package_string
