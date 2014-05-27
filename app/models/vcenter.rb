require 'rbvmomi'

class Vcenter < ActiveRecord::Base
  validate :url, presence: true

  attr_accessor :ram, :storage, :cpu_cores, :cpu_frequency

  def get_data 
    connect
    set_ram
    set_storage
    set_cpu_cores
    set_cpu_frequency
  end

  private 

    def set_ram
      @ram = @vcentre.summary.memory_stats
    end

    def set_storage
      @storage = @vcentre.summary.storage_stats
    end

    def set_cpu_cores
      @cpu_cores = @vcentre.summary.cpu_core_stats
    end

    def set_cpu_frequency
      @cpu_frequency = @vcentre.summary.cpu_frequency_stats
    end

    def connect 
      @vim ||= RbVmomi::VIM.connect(connection_opts)
      @vcentre ||= VSphere::VCenter.new(@vim)
    end

    def connection_opts
     { host: self.url, insecure: true, user: 'svc-vmcreator', password: 'O5ZkSFQ8b8gP' }
    end
end
