############################################################################### 
# This conf file was auto-generated by rwssl script
# Author: Rehmat Alam
# GitHub Repo: (https://github.com/rehmatworks/serverpilot-letsencrypt/)
# Twitter: https://twitter.com/rehmatworks
# Email: contact@rehmat.works
#
# This file rewrites ACME root in order to prevent issues during ACME challenge
# verification & later in renewal process. HTACCESS or NGINX rules may interfere
# with ACME requests and may result in renewal failure. This conf file prevents
# that from happening.
###############################################################################

location ^~ /.well-known/acme-challenge/ {
    default_type "text/plain";
    rewrite /.well-known/acme-challenge/(.*) /$1 break;
    root /var/.rwssl/.well-known/acme-challenge/;
}