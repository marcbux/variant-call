# coding: utf-8
#
# Cookbook Name:: variant-call
# Recipe:: hdfs
#
# Copyright (c) 2015 Marc Bux, All Rights Reserved.

# copy input data into HDFS
bash "copy_reads_to_hdfs" do
  user node[:hiway][:user]
  group node[:hadoop][:group]
  code <<-EOH
  set -e && set -o pipefail
    #{node[:hadoop][:home]}/bin/hdfs dfs -put #{node[:dir][:data]}/#{node[:kgenomes][:dirname]} #{node[:hiway][:hiway][:hdfs][:basedir]}/#{node[:kgenomes][:dirname]}
  EOH
  not_if "#{node[:hadoop][:home]}/bin/hdfs dfs -test -e #{node[:hiway][:hiway][:hdfs][:basedir]}/#{node[:kgenomes][:dirname]}"
end

# copy reference to hdfs
bash "copy_reference_to_hdfs" do
  user node[:hiway][:user]
  group node[:hadoop][:group]
  code <<-EOH
  set -e && set -o pipefail
    #{node[:hadoop][:home]}/bin/hdfs dfs -put #{node[:dir][:data]}/#{node[:hg38][:dirname]} #{node[:hiway][:hiway][:hdfs][:basedir]}/#{node[:hg38][:dirname]}
  EOH
  not_if "#{node[:hadoop][:home]}/bin/hdfs dfs -test -e #{node[:hiway][:hiway][:hdfs][:basedir]}/#{node[:hg38][:dirname]}"
end
