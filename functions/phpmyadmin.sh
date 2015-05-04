#!/bin/bash
# Author:  yeho <lj2007331 AT gmail.com>
#
# This script's project home is:
#       https://lempstack.com
#       https://github.com/lj2007331/lempstack

Install_phpMyAdmin()
{
cd $lemp_dir/src
. ../functions/download.sh 
. ../options.conf 

src_url=http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.4.4/phpMyAdmin-4.4.4-all-languages.tar.gz && Download_src

tar xzf phpMyAdmin-4.4.4-all-languages.tar.gz
/bin/mv phpMyAdmin-4.4.4-all-languages $home_dir/default/phpMyAdmin
/bin/cp $home_dir/default/phpMyAdmin/{config.sample.inc.php,config.inc.php}
mkdir $home_dir/default/phpMyAdmin/{upload,save}
sed -i "s@UploadDir.*@UploadDir'\] = 'upload';@" $home_dir/default/phpMyAdmin/config.inc.php
sed -i "s@SaveDir.*@SaveDir'\] = 'save';@" $home_dir/default/phpMyAdmin/config.inc.php
chown -R www.www $home_dir/default/phpMyAdmin
cd ..
}