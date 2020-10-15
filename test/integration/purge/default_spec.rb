describe package 'cloud-init' do
  it { should_not be_installed }
end

describe directory '/etc/cloud' do
  it { should_not exist }
end

describe directory '/var/lib/cloud' do
  it { should_not exist }
end
