name              "rabbitmq"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs and configures RabbitMQ server"
version           "1.8.1"
recipe            "rabbitmq", "Install and configure RabbitMQ"
recipe            "rabbitmq::cluster", "Set up RabbitMQ clustering."
recipe            "rabbitmq::plugin_management", "Manage plugins with node attributes"
recipe            "rabbitmq::virtualhost_management", "Manage virtualhost with node attributes"
recipe            "rabbitmq::user_management", "Manage users with node attributes"
depends           "apt", ">= 1.4.4"
depends           "yum", ">= 0.5.0"
depends           "erlang", ">= 0.9"

%w{ubuntu debian redhat centos scientific amazon fedora oracle smartos}.each do |os|
  supports os
end

attribute "rabbitmq",
  :display_name => "RabbitMQ",
  :description => "Hash of RabbitMQ attributes",
  :type => "hash"

attribute "rabbitmq/nodename",
  :display_name => "RabbitMQ Erlang node name",
  :description => "The Erlang node name for this server.",
  :default => "node['hostname']"

attribute "rabbitmq/address",
  :display_name => "RabbitMQ server IP address",
  :description => "IP address to bind."

attribute "rabbitmq/port",
  :display_name => "RabbitMQ server port",
  :description => "TCP port to bind."

attribute "rabbitmq/config",
  :display_name => "RabbitMQ config file to load",
  :description => "Path to the rabbitmq.config file, if any."

attribute "rabbitmq/logdir",
  :display_name => "RabbitMQ log directory",
  :description => "Path to the directory for log files."

attribute "rabbitmq/mnesiadir",
  :display_name => "RabbitMQ Mnesia database directory",
  :description => "Path to the directory for Mnesia database files."

attribute "rabbitmq/cluster",
  :display_name => "RabbitMQ clustering",
  :description => "Whether to activate clustering.",
  :default => "no"

attribute "rabbitmq/cluster_config",
  :display_name => "RabbitMQ clustering configuration file",
  :description => "Path to the clustering configuration file, if cluster is yes.",
  :default => "/etc/rabbitmq/rabbitmq_cluster.config"

attribute "rabbitmq/cluster_disk_nodes",
  :display_name => "RabbitMQ cluster disk nodes",
  :description => "Array of member Erlang nodenames for the disk-based storage nodes in the cluster.",
  :default => [],
  :type => "array"

attribute "rabbitmq/erlang_cookie",
  :display_name => "RabbitMQ Erlang cookie",
  :description => "Access cookie for clustering nodes.  There is no default."

attribute "rabbitmq/virtualhosts",
  :display_name => "Virtualhosts on rabbitmq instance",
  :description => "List all virtualhosts that will exist",
  :default => [],
  :type => "array"

attribute "rabbitmq/enabled_users",
  :display_name => "Users and their rights on rabbitmq instance",
  :description => "Users and description of their rights",
  :default => [{ :name => "guest", :password => "guest", :rights => [{:vhost => nil , :conf => ".*", :write => ".*", :read => ".*"}]}],
  :type => "array"

attribute "rabbitmq/disabled_users",
  :display_name => "Disabled users",
  :description => "List all users that will be deactivated",
  :default => [],
  :type => "array"

attribute "rabbitmq/enabled_plugins",
  :display_name => "Enabled plugins",
  :description => "List all plugins that will be activated",
  :default => [],
  :type => "array"

attribute "rabbitmq/disabled_plugins",
  :display_name => "Disabled plugins",
  :description => "List all plugins that will be deactivated",
  :default => [],
  :type => "array"
