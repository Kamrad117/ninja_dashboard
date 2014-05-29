module VcentersHelper
  def properties_need_chart(obj)
    [:ram, :storage, :cpu_cores, :cpu_frequency]
    .select{ |p| !obj.send(p).values.include?(nil) && !obj.send(p).values.include?(0) }
  end

  def col_size(obj)
    12/properties_need_chart(obj).count 
  end

  def data_for_chart(hash)
    hash.delete(:total)
    hash
  end

  def percent_used(obj, property)
    unless((obj.send(property)[:total].nil?) or (obj.send(property)[:total] == 0) or (obj.send(property)[:used].nil?) or (obj.send(property)[:used] == 0)) 
      (obj.send(property)[:used].to_f / obj.send(property)[:total].to_f * 100).round(1)
    else 
      'N/A'
    end
  end
end
