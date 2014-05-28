module VSphere
  class VHost
    include VSphere::Displayable

    attr_reader :summary, :datastores

    def initialize(instance)
      @host = instance
      @datastores = VSphere::Conversions::Datastore(@host.datastore)
      @summary = VSphere::Conversions::Summary [@host] + @datastores
    end

    def name
      @host.name
    end

    def ram
      @summary.memory_stats
    end

    def storage
      @summary.storage_stats
    end

    def cpu_cores
      @summary.cpu_cores_stats
    end

    def cpu_frequency
      @summary.cpu_frequency_stats
    end

  end
end
