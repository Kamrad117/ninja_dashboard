module VcentersHelper
  def properties_need_chart
    [:ram, :storage, :cpu_cores, :cpu_frequency]
    .select{ |p| !@vcenter.send(p)[:free].nil? && !@vcenter.send(p)[:used].nil? }
  end

  def col_size
    12/properties_need_chart.count 
  end
end
