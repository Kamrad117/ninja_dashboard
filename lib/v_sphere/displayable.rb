module VSphere
  module Displayable

    #stats format functions
    def memory_stats
      { total: total_memory.round(1), used: used_memory.round(1), free: free_memory.round(1) }
    end

    def cpu_cores_stats
      { total: cpu_cores_number.round(1), used: nil, free: nil}
    end

    def cpu_frequency_stats
      { total: total_cpu_frequency.round(1), used: used_cpu_frequency.round(1), free: free_cpu_frequency.round(1) }
    end

    def storage_stats
      { total: capacity.round(1), used: used_space.round(1), free: free_space.round(1) }
    end

  end
end
