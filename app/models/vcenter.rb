require 'rbvmomi'
  
class Vcenter < ActiveRecord::Base
  validate :url, presence: true, uniqueness: true

  attr_accessor :ram, :storage, :cpu_cores, :cpu_frequency, :pools

  def get_data 
    connect
    set_ram
    set_storage
    set_cpu_cores
    set_cpu_frequency
    set_pools
  end

  def get_pools_data
    connect
    set_pools
  end
  
private 

  def set_ram
    @ram = @vcenter.summary.memory_stats
  end

  def set_storage
    @storage = @vcenter.summary.storage_stats
  end

  def set_cpu_cores
    @cpu_cores = @vcenter.summary.cpu_cores_stats
  end

  def set_cpu_frequency
    @cpu_frequency = @vcenter.summary.cpu_frequency_stats
  end

  def set_pools 
    @pools = @vcenter.host_list
  end

  def connect 
    @vim ||= RbVmomi::VIM.connect(connection_opts)
    @vcenter ||= VSphere::VCenter.new(@vim)
  end

  def connection_opts
   { host: self.url, insecure: true, user: 'svc-vmcreator', password: 'O5ZkSFQ8b8gP' }
  end
end
