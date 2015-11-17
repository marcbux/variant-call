name 'variant-call'
maintainer "Jörgen Brandt"
maintainer_email "brandjoe@hu-berlin.de"
license 'all_rights'
description 'Installs/Configures variant-call'
long_description 'Installs/Configures variant-call'
version '0.1.0'

depends "java"
depends "git"
depends "hadoop"
depends "kagent"
depends "git"
depends "chef-bioinf-worker"
depends "chef-cuneiform"

attribute "dir/wf",
:display_name => "Cuneiform Workflow Directory",
:description => "Directory, in which Cuneiform workflows are to be placed",
:type => 'string',
:default => "/opt/wf"

attribute "dir/data",
:display_name => "Cuneiform Data Directory",
:description => "Directory, in which Cuneiform workflow data is to be placed",
:type => 'string',
:default => "/opt/data"
