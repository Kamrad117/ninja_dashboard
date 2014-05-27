class Vcenter < ActiveRecord::Base
  validate :url, presence: true

  attr_accessor :ram, :storage, :cpu_cores, :cpu_frequency

  def get_data 
    set_ram
    set_storage
    set_cpu_cores
    set_cpu_frequency
  end

  private 

    def set_ram
      @ram = {total: 10000, used: 7000}
    end

    def set_storage
      @storage = {total: 10000, used: 7000}
    end

    def set_cpu_cores
      @cpu_cores = {total: 10000, used: nil}
    end

    def set_cpu_frequency
      @cpu_frequency = {total: 10000, used: 7000}
    end


end
