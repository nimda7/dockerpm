#!/bin/sh -x

if [[ $# -eq 0 ]] ; then
    echo "Usage: $(basename "$0") file.spec"
    exit 0
fi

spec_file="/root/rpmbuild/SPECS/${1}"

if [ ! -e $spec_file ]; then
    echo "Spec file not found!"
    exit 0
fi

chown root:root "${spec_file}"

echo "Installing from BuildRequires"
yum-builddep -y /root/rpmbuild/SPECS/

echo "Installing all Sources and Patches."
spectool -A -g -D -C /home/rpmbuild/SOURCES "${spec_file}"

echo "Linting spec file."
rpmlint "${spec_file}"

rpmbuild -ba "${spec_file}"
