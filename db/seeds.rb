vcenters = [
"yyz1-tchain01.prd.rmsonecloud.net",
"lhr1-tchain01.prd.rmsonecloud.net",
"kef1-vcenter-03.swlab.rmscloud.net",
"hwd1-vcenter-03.swlab.rmscloud.net"
]

vcenters.each do |url|
  Vcenter.create!(url: url)
end
